---
layout: page
parent: fMRI preprocessing
title: 5. Smooth functional files
permalink: /Tutorials/preprocessing/smooth
---

**NOTE:** The following code assumes you are starting in the main study directory. To change into the main directory:
```
cd /Users/Shared/charm/data/bids_data/
```

# Smooth files
1. Prior to running our first level analyses, we'll need to smooth our functional data.  We've created a batch script to be able to smooth multiple subjects files at once. This script will need to be run in Matlab (can be found in the Applications folder).  Once in Matlab, you can open and edit this file:
```
/Users/Shared/charm/data/bids_data/code/charm_5_spm_smooth_firstlevel_noorth_multi.m
```
2. To edit the file, navigate to the code directory then type:
```
edit charm_6_spm_smooth_firstlevel_noorth_multi.m
```
The only line that should need to be adjusted is the subjects line.  You should replace the subject ids listed with the ones you wish to run.  For example, this line looks something like:
```
subjects = {'40376', '40378', '40383', '40394', '40397','40401','40407'};
```
You may also adjust the session number if need be. 
3. Once you've made the necesary changes to the file, you can save it, then run it.  You can do this by clicking Run or by typing the following into the Matlab command window:
```
charm_6_spm_smooth_firstlevel_noorth_multi.m
```
