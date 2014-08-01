#!/usr/bin/env bash

# install Beanstalkd
apt-get install -qq beanstalkd

# set to start on system start
sed -i "s/#START=yes/START=yes/" /etc/default/beanstalkd

# start Beanstalkd
service beanstalkd start
