# Config Files

This repository contains my config files. I use it to sychronize my configs 
between different environments.

Please feel free to use any configurations you find here, but understand that 
you do so at your own risk. I will not accept responsibility for any loss or 
damages resulting from your use of these files or their contents.

## Sync Instructions

These instructions describe how to sync the files from this repository with 
the current user's home directory. Please perform a dry run prior to syncing 
any files.

THIS CAN OVERWRITE THE FILES IN YOUR HOME DIRECTORY. YOU HAVE BEEN WARNED.

### Dry Run (**IMPORTANT**)

Prior to syncing, perform a dry run using:
```
rsync -anv --exclude=.git --exclude=README.md --exclude=LICENSE.md . ~
```
This will show a preview of the files that will be sync'd without actually 
running the command.

### Syncing Files

After cloning the repository, sync the files with the home directory by 
running the following command from within the configs directory that you 
cloned:
```
rsync -av --exclude=.git --exclude=README.md --exclude=LICENSE.md ./ ~
```
This will sync files between this repository and the home directory.


