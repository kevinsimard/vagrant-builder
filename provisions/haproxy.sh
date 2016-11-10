#!/usr/bin/env bash

# install HAProxy
echo -e "\e[1;34mInstalling HAProxy...\e[0m"
apt-get install -qq haproxy

# enable HAProxy via init script
sed -i "s/ENABLED=0/ENABLED=1/" /etc/default/haproxy
