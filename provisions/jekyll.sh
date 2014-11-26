#!/usr/bin/env bash

if which rvm > /dev/null; then
    # install requirements
    apt-get install -qq libv8-dev

    # install Jekyll
    echo -e '\e[1;34mInstalling Jekyll...\e[0m'
    gem install jekyll
else
    echo -e '\e[1;34mERROR: RVM is required to install Jekyll!\e[0m'
fi
