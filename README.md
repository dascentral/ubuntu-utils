# Ubuntu Utils

## Introduction

A collection of scripts and utility files that aid in the setup and administration of Ubuntu servers.

### Assumptions

The scripts within this repo rely upon a number of assumptions that are not documented as well as I might like. If you setup your Ubuntu servers in a consistent manner, these scripts may work very well for you. If not, I admit they may not error as gracefully as they should.

While I would love for these scripts to be helpful to others, they exist primarily to faciltiate my systems administration activities and address only a very small sliver of the needs within the sysadmin/DevOps world.

## Installation

This is a fairly simple clone from GitHub. All scripts within this repo assume the repo is cloned into the `~/utils` folder.

### Via HTTP

```bash
git clone https://github.com/dascentral/ubuntu-utils.git ~/utils && cd ~/utils && ./install.sh
```

### Via SSH

```bash
git clone git@github.com:dascentral/ubuntu-utils.git ~/utils && cd ~/utils && ./install.sh
```

## Updates

The installation script can be run multiple times to ensure that the latest from the repository is available to the local server and that all software has been installed.

```bash
cd ~/utils
./install.sh
```

## Update packages

Depending upon the distribution used during initial installation of the operating system, you likely have a number of packages with updates pending. You can install those updates via the following:

```bash
sudo apt update
sudo apt upgrade
```

## Random Nuggets

### Laravel Storage Folder

So, I haven't quite yet nailed the RSYNC command necessary to properly deploy Laravel's storage folder for a new website. These commands will create the necessary folder structure:

```bash
mkdir -p storage/app
mkdir -p storage/framework/cache
mkdir -p storage/framework/sessions
mkdir -p storage/framework/testing
mkdir -p storage/framework/views
mkdir -p storage/logs
```

