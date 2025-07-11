---
layout: page
parent: fMRI preprocessing
title: 2. Convert Data from DCM to BIDS
permalink: /Tutorials/preprocessing/convert
---

# Introduction
After copying over data from the BIC, we need to convert these files into BIDS format.

**NOTE:** The following code assumes you are starting in the main study directory. To change into the main directory:
```
cd /Users/Shared/charm/data/bids_data/
```

# BIDS-ifying Data
1. Assuming the scan ran as planned, you should be able to convert the files you copied into sourcedata into BIDS format using dcm2bids and the standard configuration using the following commands
```
code/charm_2_dcm2bids.sh -p participant_id -s session_id
```
2. Watch the terminal window and take note of any errors or warnings. After the script is complete, a new directory will be made labeled sub-participantid. Review the contents of this directory and make sure all expected files are in there and there are no extra files (e.g., `ls`).
3. If dcm2bids cannot figure out what to do with an image, it will try its best to label the image and put it into a tmp_dcm2bids folder (e.g., /Users/Shared/charm/data/bids_data/tmp_dcm2bids). Some images are okay to ignore, including Scout and Derived/Reconstructed images.  Check this folder and verify all appears as expected.
4. If you are uncertain whether the files were converted appropriately, you can run bids-validator as a final check. **Warning:**  This will check every participant in bids_data so may have extensive output.
```
bids-validator /Users/Shared/charm/data/bids_data/
```
5. Mark **Imaging QA** appropriately. If you ran into any issues or if bids_validator threw any errors, make a note.


# Check for gross errors
1. Perform an initial check of the anatomical and functional data sets to ensure no gross errors exist and to make note of any incidental findings.  This will be done using fsleyes
```
fsleyes
```
2. This program will take sometime to load.  Once loaded, select File -> Add from file and choose the T1 anatomical image from the anat directory.
3. Using the GUI, scroll through the slices of the 3D image and note any oddities or distortions in **Imaging QA**
4. Next, check each of the functional images.  You can open these files using File -> Add from file.  Note:  You'll be able to see every imaging file you open layered on top of one another.  To avoid this, you can close images you are finished looking at or by clicking the 'eye' icon next to the filename in the 'Overlay list' to hide it.
5. Like the anatomical file, scroll through the 3D image and note any oddities or distoritions.  But because functional images are 4D (they have a time component), you'll need to use the movie tool to view each of the time points.  The movie tool can be found on the toolbar and looks like a film strip.  Click it and a 'movie' will run where you will be able to view each timepoint.  You'll see the 'Volume' number increase within the 'Location' box as it cycles through each timepoint. The movie will continuously loop, you just need to complete one viewing (i.e., just review the images until Volume cycles back to 0).  Again, note any oddities or distoritions in **Imaging QA**.
