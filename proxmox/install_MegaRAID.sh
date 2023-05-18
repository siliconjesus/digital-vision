#!/usr/bin/env bash

# Need to get the version of a debian based system (which Proxmox is)
# to install the correct repos - you can also do this through other means
# but as proxmox continues to expand, I try to use commands I know will work 
# every time regardless of what packages are installed on a system.

DEBIAN_VERSION=`grep VERSION_CODENAME /etc/os-release | awk -F\= '{print $2}'` 

# Install the Keys
wget -O - https://hwraid.le-vert.net/debian/hwraid.le-vert.net.gpg.key | sudo apt-key add -

# Add the Source
echo "deb http://hwraid.le-vert.net/distrib $DEBIAN_VERSION main" >> /etc/apt/sources.list

# Update
apt update -y

# Install & clean up
apt install -y megaclisas-status megacli megaraid-status
apt clean all