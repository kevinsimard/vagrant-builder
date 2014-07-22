#!/usr/bin/env bash

# update packages
apt-get update

# upgrade packages
apt-get upgrade -y

# install essential packages
apt-get install -y make automake autotools openssl\
    git-core screen curl build-essential htop unzip zip
