#!/usr/bin/env bash

if which php > /dev/null; then
    # download and install Composer to /usr/bin directory
    echo -e '\e[1;34mInstalling Composer...\e[0m'
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin

    # create a symlink from composer.phar to composer
    ln -s /usr/bin/composer.phar /usr/bin/composer
else
    echo -e '\e[1;34mERROR: PHP is required to install Composer!\e[0m'
fi
