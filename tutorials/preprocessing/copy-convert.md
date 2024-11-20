---
layout: page
parent: fMRI preprocessing
title: 1. Copy Data and BIDS-ify
permalink: /Tutorials/preprocessing/copy-convert
---

# Introduction
We will need to copy over the  data from our local neuroimaging center [BIC](https://medschool.cuanschutz.edu/psychiatry/research/services/brain-imaging-center), convert these files into BIDS format, and copy over the Eprime files collected during the scan to begin.

**Note** Accessing BIC and REDCap servers requires special authorization.  Contact Dr. Novick to obtain this.

# Copying Data From the BIC
1. Review [REDCap](https://redcap.ucdenver.edu/redcap_v14.5.19/DataExport/index.php?pid=21666&report_id=129155) to determine which participant's have completed a scanning session and require preprocessing.
2. For the relevant session (e.g., Baseline or Follow-up), open the **Imaging QA** instrument and review the notes.
3. Back on the server, verify that the BIC server is mounted by opening a terminal windows and using
```
ls /Volumes/bic-server.ucdenver.pvt
```
4. If BIC is mounted, change into the main bids directory (e.g., /Users/Shared/charm/data/bids_data/) and run the following
```
cd /Users/Shared/charm/data/bids_data/
code/charm_1_copy_bic_data.sh -p participant_id -s session_id
```
This will locate a DICOM folder containing all the imaging files for a given participant/session and then copy these data into the 'sourcedata' directory (e.g., /Users/Shared/charm/data/bids_data/sourcedata).  This will be the home of all 'raw' data for the study.
5. Verify the files for this participant's session are now in the sourcedata directory
```
ls /Users/Shared/charm/data/bids_data/sourcedata/partipantid_session
```
6. Mark **Imaging QA** appropriately. If you run into any issues copying these data, make a note.


# BIDS-ifying Data
1. Assuming the scan ran as planned, you should be able to convert the files into BIDS format using dcm2bids and the standard configuration using the following commands
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
Take note of any warnings or errors.
5. Mark **Imaging QA** appropriately. If you ran into any issues, make a note.

# Copy Eprime data
1. Eprime data for each session is uploaded into [REDCap](https://redcap.ucdenver.edu/redcap_v14.5.19/DataExport/index.php?pid=21666&report_id=129155).  You can download these files by clicking on each of the links.
2. Copy the eprime data into the sourcedata directory
