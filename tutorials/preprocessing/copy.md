---
layout: page
parent: fMRI preprocessing
title: 1. Copy Data from BIC
permalink: /Tutorials/preprocessing/copy
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


# Copy Eprime data
1. Eprime data for each session is uploaded into [REDCap](https://redcap.ucdenver.edu/redcap_v14.5.19/DataExport/index.php?pid=21666&report_id=129155).  You can download these files by clicking on each of the links.
2. Copy the eprime data into the sourcedata directory
3. Mark **Imaging QA** appropriately. If you run into any issues copying these data, make a note.
