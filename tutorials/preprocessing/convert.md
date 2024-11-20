---
layout: page
parent: fMRI preprocessing
title: 2. Convert Data from DCM to BIDS
permalink: /Tutorials/preprocessing/convert
---

# Introduction
After copying over data from the BIC, we need to convert these files into BIDS format.

# BIDS-ifying Data
1. Assuming the scan ran as planned, you should be able to convert the files you copied into sourcedata into BIDS format using dcm2bids and the standard configuration using the following commands
```
cd /Users/Shared/charm/data/bids_data/
code/charm_2_dcm2bids.sh -p participant_id -s session_id
```
2. Watch the terminal window and take note of any errors or warnings. After the script is complete, a new directory will be made labeled sub-participantid. Review the contents of this directory and make sure all expected files are in there and there are no extra files (e.g., `ls`).
3. If dcm2bids cannot figure out what to do with an image, it will try its best to label the image and put it into a tmp_dcm2bids folder (e.g., /Users/Shared/charm/data/bids_data/tmp_dcm2bids). Some images are okay to ignore, including Scout and Derived/Reconstructed images.  Check this folder and verify all appears as expected.
4. Run bids-validator as a final check
```
bids-validator /Users/Shared/charm/data/bids_data/
```
5. Mark **Imaging QA** appropriately. If you ran into any issues or if bids_validator threw any errors, make a note.
