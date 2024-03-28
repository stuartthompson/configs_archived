**Archived: 2024-03-28**
This repository is archived and is no longer being updated. It will be removed once I'm sure there is nothing else here I need.

# Config Files

This repository contains my config files. I use it to sychronize my configs
between different environments.

Please feel free to use any configurations you find here, but understand that
you do so at your own risk. I will not accept responsibility for any loss or
damages resulting from your use of these files or their contents.

## Synchronizing Files

The files in this repository should be placed with the user's home directory.
The following files should not be copied:

* .git (the repository tracking folder)
* README.md (this file)
* LICENSE.md (the license file)
* syncfiles.sh (a script used to automate the copy process)

There are a few mechanisms to sync the files with the home directory.

## Copying Manually

The simplest process is to copy the files from this repository into the home
directory. This process also allows for omitting configuration files that are
unwanted.

## Synchronize using syncfiles script

The included syncfiles.sh script runs a program called rsync to copy over only
files with changes from this repository to the home directory. This script is
run in two ways:

```
syncfiles.sh
```
*(performs a dry run, showing a preview of what will be copied)*

```
syncfiles.sh -e
```
*(sync the files)*

## Synchronize using rsync

The second way to synchronize files is to call rsync directly. This is the
same as calling the syncfiles.sh script without the indirection. Calling
rsync directly allows for specifying more exclude directives to copy fewer
files to the destination.

**Please perform a dry run prior to syncing any files.**

THIS CAN OVERWRITE THE FILES IN YOUR HOME DIRECTORY. YOU HAVE BEEN WARNED.

## Dependencies

This process relies upon rsync to copy the files from this repository to
the user's home directory.

Instructions for installing rsync are avilable here:
https://github.com/WayneD/rsync/blob/master/INSTALL.md

##### Dry Run (**IMPORTANT**)

Prior to syncing, perform a dry run using:
```
rsync -anv --exclude=.git --exclude=README.md --exclude=LICENSE.md . ~
```
This will show a preview of the files that will be sync'd without actually
running the command.

##### Syncing Files

After cloning the repository, sync the files with the home directory by
running the following command from within the configs directory that you
cloned:
```
rsync -av --exclude=.git --exclude=README.md --exclude=LICENSE.md ./ ~
```
This will sync files between this repository and the home directory.
