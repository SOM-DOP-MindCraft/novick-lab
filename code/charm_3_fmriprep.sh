#!/bin/bash

## Example script to run fmriprep on charm subject reward task

task_id=reward								# Default task to preprocess
bids_dir=/Users/Shared/charm/data/bids_data	# Default bids data directory 
output_dir=fmriprep_v2						# Default location for output in bids_data/derivatives
bids_filter_file=/Users/Shared/charm/code/bids_filter_file.json # BIDS filter file that selects ses-01 T1 for preprocessing

## Process command line arguments
usage(){ echo "Usage: `basename $0` -p <participant_id> -t <task_id> -b <bids_dir> -o <output_dir>
p:	bids participant ID
t: 	optional task ID to preprocess, no default set
b:	optional path to bids data directory, default is /Users/Shared/charm/data/bids_data
o:  optional folder name for fmriprep output, default is fmriprep_v2

Run fmriprep on single session using fmriprep-docker and place output in <bids_dir>/derivatives/<output_dir>
Output is in template space MNI152NLin6Asym:res-02

Example: `basename $0` -p 40345 -t reward -b /Users/Shared/charm/data/bids_data -o fmriprep
" 1>&2; exit 1; }

if [ $# -lt 2 ]; then
	usage
fi

while getopts "p:t:b:o:" opt; do
    case "${opt}" in
        p)
            participant_id=${OPTARG}
            ;;
        t)
        	task_id=${OPTARG}
        	;;
        b)
        	bids_dir=${OPTARG}
        	;;
        o)
        	output_dir=${OPTARG}
        	;;        	
        *)
            usage
            ;;
    esac
done



echo "
fmriprep-docker $bids_dir $bids_dir/derivatives/$output_dir participant \
--participant-label $participant_id \
--stop-on-first-crash \
--fs-license-file /Users/fmriuser/license.txt \
--bids-filter-file $bids_filter_file \
--nprocs 8 \
--mem 24000 \
--output-spaces MNI152NLin6Asym:res-02 \
-v \
-w /Users/Shared/work
"

fmriprep-docker $bids_dir $bids_dir/derivatives/$output_dir participant \
	--participant-label $participant_id \
	--stop-on-first-crash \
	--fs-license-file /Users/fmriuser/license.txt \
	--bids-filter-file $bids_filter_file \
	--nprocs 8 \
	--mem 24000 \
	--output-spaces MNI152NLin6Asym:res-02 \
	-v \
	-w /Users/Shared/work
	
	
