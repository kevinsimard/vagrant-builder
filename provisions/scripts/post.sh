#!/usr/bin/env bash

# upgrade distribution packages
echo -e '\e[1;34mUpgrading distribution packages...\e[0m'
apt-get dist-upgrade -qq

# remove unused packages
echo -e '\e[1;34mRemoving unused packages...\e[0m'
apt-get autoremove -qq
