#!/usr/bin/env bash

# remove unused packages
apt-get autoremove -qq

# upgrade distribution
apt-get dist-upgrade -qq
