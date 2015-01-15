#!/usr/bin/env bash

# create Swap file
echo -e "\e[1;34mCreating Swap file of $1MB...\e[0m"
dd if=/dev/zero of=/swapfile bs=1024 count=$1k

# create Swap area
mkswap /swapfile

# enable Swap file
swapon /swapfile

# make Swap file permanent
echo '/swapfile    none    swap    sw    0    0' | tee -a /etc/fstab

# set Swap swappiness to 10
echo 10 | sudo tee /proc/sys/vm/swappiness
echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf

# set Swap file permissions
chown root:root /swapfile
chmod 0600 /swapfile
