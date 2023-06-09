#!/usr/bin/env bash

# Need to get the version of a debian based system (which Proxmox is)
# to install the correct repos - you can also do this through other means
# but as proxmox continues to expand, I try to use commands I know will work 
# every time regardless of what packages are installed on a system.

DEBIAN_VERSION=`grep VERSION_CODENAME /etc/os-release | awk -F\= '{print $2}'` 

# Install the Keys
wget -O - https://hwraid.le-vert.net/debian/hwraid.le-vert.net.gpg.key | sudo apt-key add -

# Add the Source
echo "#MegaRAID Drivers" >> /etc/apt/sources.list
echo "deb http://hwraid.le-vert.net/debian $DEBIAN_VERSION main" >> /etc/apt/sources.list

# Update
apt-get update -y

# Install & clean up
apt-get install -y megaclisas-status megacli
apt clean all