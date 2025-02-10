---
layout: page
parent: fMRI preprocessing
title: 4. Organize onsets and unzip files
permalink: /Tutorials/preprocessing/organize
---

**NOTE:** The following code assumes you are starting in the main study directory. To change into the main directory:
```
cd /Users/Shared/charm/data/bids_data/
```

# Organizing onsets
1. In this study, we are utilizing E-prime to run the task. E-prime will produce files (*.edat3 and Reward_Task*.txt and OnsetTimes*.txt) for each run that will list the onset information alongside relevant behavior information (e.g., RT and RESP).  Before we move on, we need to make sure these files (which are stored in REDCap) are copied into the proper subject directory located in:
```
ls /Users/Shared/charm/data/bids_data/sourcedata/<subject_id>/<ses-id>
```
2. Once these files are in place, make sure you are in the main bids directory (e.g., /Users/Shared/charm/data/bids_data/) and run the following
```
code/charm_4_organize_firstlevel_inputs.sh -p participant_id -s session_id
```
This will, first, parse out OnsetTimes into files for each of the individual contrasts for each of the runs. Then the script will then unzip the files that will be used during first level analyses which are contained in the derivatives directory for each subject/session and include the label `space-MNI152NLin6Asym_res-02_desc-preproc_bold`.

# Review output
1. Once the script is finished, check the subject/session directory under `/Users/Shared/charm/data/bids_data/sourcedata`.  You should see files representing each of the conditions for each of the runs (e.g., Neutral Cue, Pleasant Cue, Neutral Pic, Pleasant Pic, etc).:
2. Next, check to make sure the appropriate fmriprep file has been unzipped
```
ls /Users/Shared/charm/data/bids_data/derivatives/fmriprep_v2/<subject_id>/<ses-id>/func/*space-MNI152NLin6Asym_res-02_desc-preproc_bold*
```
