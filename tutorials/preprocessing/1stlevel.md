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
/Users/Shared/charm/data/bids_data/code/charm_6_firstlevels.sh -p participant_id -s session_id
```
2. Once completed, the first level analyses can be found in:
```
/Volumes/Expansion/charm/data/bids_data/derivatives/1stlevel_20250701/
```
