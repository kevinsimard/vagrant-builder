#!/usr/bin/env bash

# update packages
apt-get update

# upgrade packages
apt-get upgrade -y

# install essential packages
apt-get install -y make automake openssl screen\
    git-core curl build-essential htop unzip zip
