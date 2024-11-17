#!/bin/bash

study_name=CHARM					# Study name
study_id=Novick_CHARM_213530		# Default folder for Novick charm study on bic server
data_dir=/Users/Shared/charm/data	# Default local data directory for charm study


## Process command line arguments
usage(){ echo "Usage: `basename $0` -p <participant_id> -s <session_id> -d <data_dir>
p:	participant ID 
s:	session ID 
u:	your username at BIC
d:	optional path to study bids data directory, default is /Users/Shared/charm/data/bids_data

Transfer data from bic server to local directory.
- Mounts bic server as volume in <data_dir>/bic if not present in /Volumes/bic-server.ucdenver.pvt
- Copies the folder for <bic_study_id> <bic_scan_id> from bic server to bids-compatible <data_dir>/bids_data/sourcedata

Example: `basename $0` -p 40345 -s 1 -u loveti -d /Users/Shared/charm/data
" 1>&2; exit 1; }

if [ $# -lt 4 ]; then
	usage
fi

while getopts "p:s:u:d:" opt; do
    case "${opt}" in
        p)
            participant_id=${OPTARG}
            ;;
        s)
            session_id=${OPTARG}
            ;;
        u)
        	bic_user=${OPTARG}
        	;;
        d)
        	data_dir=${OPTARG}
        	;;
        *)
            usage
            ;;
    esac
done


## Set bic server mount folder and participant specific folder information
bic_vol=/Volumes/bic-server.ucdenver.pvt										# default path to bic server when mounted through mac gui
scan_id=$study_name.$participant_id.$session_id									# bic scan id for this participant and session
dest_dir=$data_dir/bids_data/sourcedata/${participant_id}_${session_id}		# path to folder where data will be copied



## Check paths

# Check for mounted bic server
if [ ! -d $bic_vol ]; then
	echo "Must mount bic folder before continuing"
	exit	
else
	bic_dir=$bic_vol
fi

# Check for scan_id folder on bic server
if [ ! -d $bic_dir/$study_id/$scan_id ]; then
	echo "Can't find data on bic server: $bic_dir/$study_id/$scan_id"
	exit
fi

# Check for bids sourcedata folder
if [ ! -d $data_dir/bids_data/sourcedata ]; then
	echo "Destination folder for bids data does not exist: $data_dir/bids_data/sourcedata"
	exit
fi

# Check for destination folder
if [ ! -d $dest_dir ]; then
	echo "Making destination folder: $dest_dir"
	mkdir $dest_dir
fi

echo "Copying scan_id: $study_id/$scan_id to data_dir: $data_dir"
rsync -avz $bic_dir/$study_id/$scan_id $dest_dir
