---
layout: page
parent: fMRI preprocessing
title: 3. Copy eprime data and organize onset data
permalink: /Tutorials/preprocessing/organize
---

**NOTE:** The following code assumes you are starting in the main study directory. To change into the main directory:
```
cd /Users/Shared/charm/data/bids_data/
```

# Copy Eprime data
1. In this study, we are utilizing E-prime to run the task. E-prime will produce files (*.edat3 and Reward_Task*.txt and OnsetTimes*.txt) for each run that will list the onset information alongside relevant behavior information (e.g., RT and RESP). Eprime data for each session is uploaded into [REDCap](https://redcap.ucdenver.edu/redcap_v14.5.19/DataExport/index.php?pid=21666&report_id=129155).  You can download these files by clicking on each of the links.
2. Copy the eprime data into the sourcedata/participantid/session directory
3. Mark **Imaging QA** in REDCap appropriately. If you run into any issues copying these data, make a note.


# Organizing onsets
1. We will need to convert the eprime files into a format that will be readable by our later first level scripts.  To accomplish this, run the following:
```
code/charm_3_organize_firstlevel_inputs.sh -p participant_id -s session_id
```
This will parse out OnsetTimes into files for each of the individual contrasts for each of the runs..

# Review onset output
1. Once the script is finished, check the subject/session directory under `/Users/Shared/charm/data/bids_data/sourcedata`.  You should see files representing each of the conditions for each of the runs (e.g., Neutral Cue, Pleasant Cue, Neutral Pic, Pleasant Pic, etc).
2. Mark **Imaging QA** in REDCap appropriately. If you run into any issues or are missing files, make a note.
