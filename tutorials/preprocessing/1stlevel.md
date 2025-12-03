---
layout: page
parent: fMRI preprocessing
title: 5. First Level Analyses
permalink: /Tutorials/preprocessing/smooth
---

**NOTE:** The following code assumes you are starting in the main study directory. To change into the main directory:
```
cd /Users/Shared/charm/data/bids_data/
```

# Unzipping, smoothing and preparing first level analyses
1. To run our first level analyses, we'll need to unzip the preprocessed data (\*space-MNI152NLin6Asym_res-02_desc-preproc_bold\*.gz data) and then apply a smoothing kernel (e.g., 5mm FWHM) to this functional data. Finally, we'll need to use SPM to generate first levels.  All of these steps can be done with the following command:
```
/Users/Shared/charm/data/bids_data/code/charm_6_smooth.sh -p participant_id -s session_id
```
2. Next, we'll need to SPM to generate first levels:
```
/Users/Shared/charm/data/bids_data/code/charm_7_firstlevel.sh -p participant_id -s session_id
```
3. Once completed, you should review each session's first level analysis in SPM to make sure everything ran as expected. You can open SPM by opening matlab and typing `spm fmri` at the prompt, selecting `Results`, choosing the session's SPM.mat file, then picking the contrast of interest.  Specifically, you should review the design matrix to make sure all the appropriate factors were included, review the mask to ensure we are sampling across the brain correctly, and take note of any other oddities.  See Andy's brain book for [more info](https://andysbrainbook.readthedocs.io/en/latest/SPM/SPM_Short_Course/SPM_Statistics/SPM_06_Stats_Running_1stLevel_Analysis.html). All first level analyses are stored in:
```
/Volumes/Expansion/charm/data/bids_data/derivatives/1stlevel_20251010/
```
