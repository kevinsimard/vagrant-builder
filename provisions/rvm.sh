#!/usr/bin/env bash

if which rvm > /dev/null; then
    # updating Ruby Version Manager
    echo -e "\e[1;34mUpdating RVM...\e[0m"
    rvm get stable --ignore-dotfiles
else
    # install RVM and install latest stable Ruby version
    echo -e "\e[1;34mInstalling RVM...\e[0m"
    curl -sSL https://get.rvm.io | bash -s stable --ruby

    # reload user profile
    source /home/vagrant/.profile
fi
