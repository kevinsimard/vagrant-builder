#!/usr/bin/env bash

# add MongoDB key to sources
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" |\
    tee /etc/apt/sources.list.d/mongodb.list

# update packages
apt-get update

# install MongoDB server
apt-get install -y mongodb-org

if which php > /dev/null; then
    # install PHP extension
    apt-get -y install php5-mongo

    # restart PHP5-FPM service
    service php5-fpm restart
fi
