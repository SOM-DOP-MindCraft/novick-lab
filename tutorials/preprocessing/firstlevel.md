---
layout: page
parent: fMRI preprocessing
title: 6. Generate first level analyses
permalink: /Tutorials/preprocessing/firstlevel
---

**NOTE:** The following code assumes you are starting in the main study directory. To change into the main directory:
```
cd /Users/Shared/charm/data/bids_data/
```

# First level analyses
1. First level, or subject level, analyses will be completed using SPM within Matlab.  We've created a batch that will let you create these files for multiple subjects at once.  
```
/Users/Shared/charm/data/bids_data/code/charm_6_firstlevel.m
```
2. To edit the file, navigate to the code directory then type:
```
edit charm_6_firstlevel.m
```
The only line that should need to be adjusted is the subjects line.  You should replace the subject ids listed with the ones you wish to run.  For example, this line looks something like:
```
subjects = {'40376', '40378', '40383', '40394', '40397','40401','40407'};
```
You may also adjust the session number if need be. 
3. Once you've made the necesary changes to the file, you can save it, then run it.  You can do this by clicking Run or by typing the following into the Matlab command window:
```
charm_6_firstlevel
```
4.  You will now be able to locate these subject's first level directories within:
```
/Users/Shared/charm/data/bids_data/derivatives/1stlevel_20250120
```
