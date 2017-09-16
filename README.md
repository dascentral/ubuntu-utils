# Ubuntu Utils

## Introduction
A collection of scripts and utility files that may aid in the administration
of Ubuntu servers.

## Assumptions
The scripts within this repo rely upon a number of assumptions that are not
documented as well as I might like. If you setup your Ubuntu servers in a
consistent manner, these scripts may work very well for you. If not, I admit
they may not error as gracefully as they should.

While I would love for these scripts to be helpful to others, they exist
primarily to faciltiate my systems administration activities and address
only a very small sliver of the needs within the sysadmin/DevOps world.

## Installation
This is a fairly simple clone from GitHub. All scripts within this repo
assume the repo is cloned into the `~/utils` folder.

**Via HTTP**

```
git clone https://github.com/dascentral/ubuntu-utils.git ~/utils && cd ~/utils && ./install.sh
```

**Via SSH**

```
git clone git@github.com:dascentral/ubuntu-utils.git ~/utils && cd ~/utils && ./install.sh
```

## Updates
The installation script can be run multiple times to ensure that the latest from the repository
is available to the local server and that all software has been installed.

```
cd ~/utils
./install.sh
```

At this time, the install script relies on the use of `sudo` so while you could run that
daily, you should avoid running it on crontab unless you have `sudoers` setup properly.


## Uninstalling Software
Initially I anticipated created shell scrips that would uninstall various software
packages from an Ubuntu server. I quickly realized that was probably a bad idea.
Instead, I have documented uninstall instructions for various packages here.

### MySQL 5.5
Backup all data before running the following commands.

#### Stop the Service
```
sudo service mysql stop
sudo killall -KILL mysql mysqld_safe mysqld
```

#### Purge Packages
Various websites list various packages when suggesting how to uninstall
MySQL. Check which packages you have installed via the following command:
```
apt list --installed
```

For my most recent uninstall attempt, I used the following:
```
sudo apt-get -y purge mysql-client-5.5
sudo apt-get -y purge mysql-client-core-5.5
sudo apt-get -y purge mysql-common
sudo apt-get -y purge mysql-server
sudo apt-get -y purge mysql-server-5.5
sudo apt-get -y purge mysql-server-core-5.5
sudo apt-get -y autoremove --purge
sudo apt-get autoclean
```

#### Remove MySQL User/Group
```
sudo deluser --remove-home mysql
sudo delgroup mysql
```

#### Remove MySQL Files
```
sudo rm -rf /etc/apparmor.d/abstractions/mysql
sudo rm -rf /etc/apparmor.d/cache/usr.sbin.mysqld
sudo rm -rf /etc/mysql
sudo rm -rf /var/lib/mysql
sudo rm -rf /var/log/mysql*
sudo rm -rf /var/log/upstart/mysql.log*
sudo rm -rf /var/run/mysqld
sudo updatedb
```

#### Reboot
```
sudo reboot
```
