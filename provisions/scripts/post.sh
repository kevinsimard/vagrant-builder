#!/usr/bin/env bash

# upgrade distribution
apt-get dist-upgrade -qq

# remove unused packages
apt-get autoremove -qq
