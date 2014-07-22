#!/usr/bin/env bash

if ! type -p php > /dev/null; then
    # download and install composer.phar to /usr/bin directory
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin

    # create a symlink from composer.phar to composer
    ln -s /usr/bin/composer.phar /usr/bin/composer
fi
