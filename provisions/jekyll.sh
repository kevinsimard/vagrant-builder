#!/usr/bin/env bash

if which rvm > /dev/null; then
    # install requirements
    apt-get install -qq libv8-dev

    # install Jekyll
    gem install jekyll
fi
