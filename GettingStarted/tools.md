---
layout: page
parent: Getting Started
title: Tools
permalink: /GettingStarted/tools
---

# Introduction
There are some tools and software packages that we commonly use when preprocessing fMRI data within the lab.

## Software

### bbedit
A WYSIWYG text editor which tends to be more friendly than [vi](https://www.vim.org/) but requires installation.

- Package can be found [here](https://www.barebones.com/products/bbedit/download.html)
- Install command line tools from BBedit menu 

### miniconda
This is an open-source package and environment manager that will allow you to create 'environments'. These 'environments'
are "self-contained, isolated spaces where you can install specific versions of software packages, including dependencies, libraries, 
and Python versions (from Conda)".  

- Installation packages can be found [here](https://docs.conda.io/en/main/miniconda.html)

### docker

FMRIprep can be run using a docker container.  What is a docker container?  They are objects that "have their own file system, 
network stack, process space, and resource limitations. Docker allows developers to separate their applications from 
their infrastructure. They are lightweight, portable, and self-sufficient and can run on a laptop or on any major cloud 
provider. (from Docker)" Using these containers helps ensure reproducability and eases setup.

- Installation packages can be found [here](https://www.docker.com)
- Once installed, you'll want to update the docker resources so they won't overwhelm the system.
  - For example, for an iMac, 8 CPUs and 16GB memory should be okay

### dcm2niix
This is a piece of open-source software that utilizes dcm2niix to convert data from a DICOM format into a NII format.

- Installation packages and instructions can be found [here](https://github.com/rordenlab/dcm2niix)
- Note: this may require sudo/administrative privileges

### dcm2bids
This is a piece of open-source software that utilizes dcm2niix to convert data from a DICOM format into a NII format 
then reorganizes the data to conform to the [BIDS](https://bids.neuroimaging.io/) standard including generating JSON
files which contain relevant metadata. We'll be setting up an environment for dcm2bids to run in using conda

```
conda create -n dcm2bids python=3.10d
conda activate dcm2bids
conda install -c conda-forge dcm2bids
```
You can check to make sure dcm2bids is working by running `dcm2bids --help` while inside that environment.

You can exit that environment using `conda deactivate`

### bids validator
This is a tool that determines whether certain files or directories conform to the bids standard

- Installation instructions can be found [here](https://bids-validator.readthedocs.io/en/latest/user_guide/command-line.html)
  - It is also available in docker through `docker pull bids/validator`
- This tool can also be run using a [web interface](https://bids-standard.github.io/bids-validator/)

### fmriprep
FMRIprep is an open-source preprocessing pipeline built for fMRI data. It's an example of a 'BIDS app' and relies on data
being formatted according to this standard.  Highly suggest reading the original publication describing [fmriprep](https://www.nature.com/articles/s41592-018-0235-4)
and consulting the [website](https://fmriprep.org/en/stable/) for the most up-to-date info on installing and running 
fmriprep. One method for running fmriprep is to utilize a docker container

- Make sure docker is working
```
docker pull hello-world
docker run –rm hello-world
```
  - If you see "Hello from Docker!", you are good to go.
- You can pull a specific version of fmriprep docker using `docker pull nipreps/fmriprep:23.0.2`
  - Read up on the appropriate version [here](https://www.nipreps.org/apps/docker/#running-a-niprep-with-a-lightweight-wrapper)
- You should install a wrapper to allow fmriprep to run using a script. This is described [here](https://reproducibility.stanford.edu/fmriprep-tutorial-running-the-docker-image/)
- Can also use pip (another package manager) to install using
```
pip install --user --upgrade fmriprep-docker
```
- Once installed, you'll need to add it to your profile
  - `bbedit ~/.zshrc`
  - Add the line `export PATH=/Users/fmriuser/.local/bin:$PATH`
  - Open a new terminal to update the path or run this command `source ~/.zshrc`
- Finally, fmriprep will require a freesurfer license to complete some of its steps
  - First, register [here](https://surfer.nmr.mgh.harvard.edu/registration.html)
  - You should then receive a license which sound be saved to your home folder (e.g., /Users/yourname)
