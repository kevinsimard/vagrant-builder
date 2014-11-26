#!/usr/bin/env bash

# download and install the latest Node Version Manager
echo -e '\e[1;34mInstalling NVM...\e[0m'
git clone https://github.com/creationix/nvm /home/vagrant/.nvm

# append NVM script to /home/vagrant/.profile
SOURCE_STR='\n[[ -s /home/vagrant/.nvm/nvm.sh ]] && . /home/vagrant/.nvm/nvm.sh # Add NVM to PATH for scripting'
echo -e $SOURCE_STR >> /home/vagrant/.profile
source /home/vagrant/.profile

# change owner of .nvm directory
chown -R vagrant. /home/vagrant/.nvm/

# get the latest version of Node from the home page
NODEJS_VERSION=`nvm ls-remote | awk 'END{print}' $1`

# install Node
echo -e '\e[1;34mInstalling Node $NODEJS_VERSION...\e[0m'
nvm install $NODEJS_VERSION

# set a default Node version
nvm alias default $NODEJS_VERSION
nvm use default

# install global Node packages
echo -e '\e[1;34mInstalling Bower...\e[0m'
npm install -g bower

echo -e '\e[1;34mInstalling Grunt-CLI...\e[0m'
npm install -g grunt-cli

# reload user profile
source /home/vagrant/.profile
