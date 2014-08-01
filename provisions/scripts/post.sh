#!/usr/bin/env bash

# remove unused packages
apt-get autoremove -y

# upgrade distribution
apt-get dist-upgrade -y
