#!/usr/bin/env bash

# update packages
echo -e "\e[1;34mUpdating packages...\e[0m"
apt-get update -qq

# upgrade packages
echo -e "\e[1;34mUpgrading packages...\e[0m"
apt-get upgrade -qq

# install essential packages
echo -e "\e[1;34mInstalling essential packages...\e[0m"
apt-get install -qq make automake openssl screen\
    git-core curl build-essential htop unzip zip

# add vagrant user to www-data group
echo -e "\e[1;34mChanging vagrant user group to www-data...\e[0m"
usermod -a -G www-data vagrant
