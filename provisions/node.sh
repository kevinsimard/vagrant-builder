#!/usr/bin/env bash

# download and install the latest Node Version Manager
git clone https://github.com/creationix/nvm /home/vagrant/.nvm

# Append NVM script to /home/vagrant/.profile
SOURCE_STR="\n[[ -s /home/vagrant/.nvm/nvm.sh ]] && . /home/vagrant/.nvm/nvm.sh # Add NVM to PATH for scripting"
echo -e $SOURCE_STR >> /home/vagrant/.profile
source /home/vagrant/.profile

# get the latest version of Node from the home page
NODEJS_VERSION=`nvm ls-remote | awk 'END{print}' $1`

# install Node
nvm install $NODEJS_VERSION

# set a default Node version
nvm alias default $NODEJS_VERSION
nvm use default

# install global Node packages
npm install -g bower
npm install -g grunt-cli

# re-source user profiles
source /home/vagrant/.profile
