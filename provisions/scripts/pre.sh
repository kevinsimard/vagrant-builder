#!/usr/bin/env bash

# update packages
apt-get update

# upgrade packages
apt-get upgrade -qq

# install essential packages
apt-get install -qq make automake openssl screen\
    git-core curl build-essential htop unzip zip

# add vagrant user to www-data group
usermod -a -G www-data vagrant
