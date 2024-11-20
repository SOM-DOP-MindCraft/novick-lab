---
layout: page
parent: fMRI preprocessing
title: 3. Run fmriprep
permalink: /Tutorials/preprocessing/fmriprep
---

**NOTE:** The following code assumes you are starting in the main study directory. To change into the main directory:
```
cd /Users/Shared/charm/data/bids_data/
```

# Running fmriprep
1. Verify that the docker application is running by looking at the dock and locating the docker application
```
>If the docker is *not* running, go to Finder, go to the application folder and open Docker

2. Once docker is running, make sure you are in the main bids directory (e.g., /Users/Shared/charm/data/bids_data/) and run the following
```
code/charm_3_copy_bic_data.sh -p participant_id
```
This will begin the fmriprep preprocessing stream.  It will copy over the raw sub-* folder contents into the `/Users/Shared/charm/data/bids_data/derivatives/fmriprep_v2` folder and prepare the data.  
This will take approximately 12 hours per participant. Be careful not to close or interrupt the terminal window while this is being done.

# Review fmriprep output for QA
1. Once the script is finished, fmriprep will output an html file which contains information that can be reviewed for QA.  This file will be labeled participantid.html and can be found in:
```
cd /Users/Shared/charm/data/bids_data/derivatives/fmriprep_v2/
```
2. To open the file, type `open participantid.html`
3. You should use the [REDCap](https://redcap.ucdenver.edu/redcap_v14.5.19/DataExport/index.php?pid=21666&report_id=129155) **Imaging QA** template to take notes and walk through the QA process.
