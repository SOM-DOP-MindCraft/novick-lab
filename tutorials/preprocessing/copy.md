---
layout: page
parent: fMRI preprocessing
title: 1. Copy Data from BIC
permalink: /Tutorials/preprocessing/copy
---

# Introduction
We will need to copy over the  data from our local neuroimaging center [BIC](https://medschool.cuanschutz.edu/psychiatry/research/services/brain-imaging-center), convert these files into BIDS format, and copy over the Eprime files collected during the scan to begin.

**NOTE:** The following code assumes you are starting in the main study directory. To change into the main directory:
```
cd /Users/Shared/charm/data/bids_data/
```

# Copying Data From the BIC
*REDCAP*
1. Review [REDCap - QA: MRI Initial Check](https://redcap.ucdenver.edu/redcap_v14.5.19/DataExport/index.php?pid=21666&report_id=129155) to determine which participant's have completed a scanning session that needs to be copied over.
2. For the relevant session (e.g., Baseline or Follow-up), open the **Imaging QA** instrument and review the notes.

*Server*
1. Verify that the BIC server is mounted by opening a terminal windows and using
```
ls /Volumes/bic-server.ucdenver.pvt
```
>If the BIC is *not* mounted, go to Finder, select Go... and Connect to Server... select the server smb:/bic-server.ucdenver.pvt and login using your university credentials.

2. Once BIC is mounted, make sure you are in the main bids directory (e.g., /Users/Shared/charm/data/bids_data/) and run the following
```
code/charm_1_copy_bic_data.sh -p participant_id -s session_id
```
This will locate a DICOM folder containing all the imaging files for a given participant/session and then copy these data into the 'sourcedata' directory (e.g., /Users/Shared/charm/data/bids_data/sourcedata).  This will be the home of all 'raw' data for the study.
3. Verify the files for this participant's session are now in the sourcedata directory
```
ls /Users/Shared/charm/data/bids_data/sourcedata/partipantid/session
```
4. Mark **Imaging QA** in REDCAP appropriately. If you run into any issues copying these data, make a note.
