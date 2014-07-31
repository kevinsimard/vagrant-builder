#!/usr/bin/env bash

if ! type -p rvm > /dev/null; then
    # updating Ruby Version Manager
    rvm get stable --ignore-dotfiles
else
    # install RVM and install latest stable Ruby version
    curl -sSL https://get.rvm.io | bash -s stable --ruby
fi
