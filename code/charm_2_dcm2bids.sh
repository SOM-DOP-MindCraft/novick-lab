#!/bin/bash

study_name=CHARM												# Study name for bic source data
config_file=/Users/Shared/charm/code/dcm2bids_config_charm.json	# Default dcm2bids config file for charm study 
bids_dir=/Users/Shared/charm/data/bids_data						# Default bids data directory 
 
 
## Process command line arguments
usage(){ echo "Usage: `basename $0` -p <participant_id> -s <session_id> -c <config_file> -b <bids_dir> 
p:	participant ID
s:	session ID
c:	optional path to custom config file for dcm2bids, default is /Users/Shared/charm/code/dcm2bids_config_charm.json
b:	optional path to bids data directory, default is /Users/Shared/charm/data/bids_data

Use dcm2bids and dcm2niix to convert raw DICOM data to bids format nifti files
Depends on the conda environment dcm2bids

Example: `basename $0` -p 40345 -s 1 -c /Users/Shared/charm/code/dcm2bids_config_charm.json -b /Users/Shared/charm/data/bids_data
" 1>&2; exit 1; }

if [ $# -lt 4 ]; then
	usage
fi

while getopts "p:s:c:b:" opt; do
    case "${opt}" in
        p)
            participant_id=${OPTARG}
            ;;
        s)
            session_id=${OPTARG}
            ;;
        c)
        	config_file=${OPTARG}
        	;;
        b)
        	bids_dir=${OPTARG}
        	;;
        *)
            usage
            ;;
    esac
done


## Set bids source data and log directories
src_dir=$bids_dir/sourcedata						# path to DICOM source data
log_dir=$bids_dir/logs								# path to folder to store conversion logs
scan_id=$study_name.$participant_id.$session_id		# bic scan id for this participant and session


## Check paths

# Check for source directory
if [ ! -d $src_dir/${participant_id}_${session_id} ]; then
	echo "Can't find source DICOM data: $src_dir/${participant_id}_${session_id}"
	exit
fi

# Check for logs directory
if [ ! -d $log_dir ]; then
	echo "Log directory does not exist: $log_dir"
	exit
fi


## Convert DICOM to bids nifti format
now=`date +"%Y%m%d%H%M%S"` 

logfile=${log_dir}/dcm2bids_output_sub-${participant_id}_ses-${session_id}_${now}.log
echo $now > $logfile
echo "Converting $participant_id $session_id" 2>&1 | tee -a $logfile
echo "dcm2bids -d $src_dir/$participant_id -p $participant_id -s 0$session_id -c $config_file -o $bids_dir"  2>&1 | tee -a ${logfile}
source activate dcm2bids
dcm2bids -d $src_dir/${participant_id}_${session_id} -p $participant_id -s 0$session_id -c $config_file -o $bids_dir --force_dcm2bids --clobber 2>&1 | tee -a ${logfile}


# Attempting to resolve an issue in the JSON with the field AcquisitionDuration producing an error 
# in bids validator. Removing the key containing AcquistionDuration from all the JSONs

# Set the directory
out_directory=$bids_dir/sub-$participant_id/ses-0$session_id

# Find all JSON files within this directory and its subdirectories
find "$out_directory" -type f -name "*.json" | while read -r file; do
  # Use jq to remove the 'AcquisitionDuration' key
  tmp_file="${file}.tmp"
  jq 'del(.AcquisitionDuration)' "$file" > "$tmp_file" && mv "$tmp_file" "$file"
done

conda deactivate
echo 2>&1 | tee -a $logfile
