---
layout: page
title: Getting Started
has_children: true
permalink: /GettingStarted/GettingStared
---

# Before we start
Our lab will be storing files using the [BIDS](https://bids.neuroimaging.io/) standard.  As such, you'll need to setup your machine, create a project folder, some initial folders to store your data, and a configuration file.

## Make sure you've installed all the necessary tools
Check out our [tools](https://neurodoclove.github.io/novick-lab/Tutorials/GettingStarted/tools) page to make sure all the necessary tools have been installed and configured before beginning

## Create a directory tree to store your data
```
mkdir /Users/Shared/charm
mkdir /Users/Shared/charm/data/bids_data
conda activate dcm2bids
dcm2bids_scaffold -o /Users/Shared/charm/data/bids_data
conda deactivate dcm2bids
```

## Create a dcm2bids configuration file
dcm2bids needs to map the raw data from the scanner to bids-compliant filenames. To do this, you will need to 
setup a configuration file that describes each scan you want to bids-ify. Details on this can be found [here](https://unfmontreal.github.io/Dcm2Bids/docs/how-to/create-config-file/)

```
mkdir /Users/Shared/charm/data/bids_data/code
bbedit /Users/Shared/charm/code/dcm2bids_config_charm.json
```

When you convert data to nifti format using dcm2niix, it will create a .json file that describes the data. 
You’ll need this information for the dcm2bids config file. The most straightforward field to use is the 
“SeriesDescription” field. This is typically (though not always) unique for each sequence in the scan.  A copy 
of this configuration file can be found on the site above as well as within the charm directory.

**Note** If one of your subjects deviates from the expected protocol, for example, a scan is re-run or a protocol
is renamed, you'll need to adjust the config file or to make a special configuration file for that subject.



