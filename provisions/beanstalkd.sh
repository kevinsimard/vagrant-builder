#!/usr/bin/env bash

# install Beanstalkd
echo -e "\e[1;34mInstalling Beanstalkd...\e[0m"
apt-get install -qq beanstalkd

# set to start on system start
sed -i "s/#START=yes/START=yes/" /etc/default/beanstalkd

# start Beanstalkd
service beanstalkd start
