#!/usr/bin/env bash

# install requirements
if ! which php > /dev/null; then
    sh php-cli.sh
fi

# download and install composer.phar to /usr/bin directory
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin

# create a symlink from composer.phar to composer
ln -s /usr/bin/composer.phar /usr/bin/composer
