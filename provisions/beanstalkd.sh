#!/usr/bin/env bash

# install Beanstalkd
apt-get install -y beanstalkd

# set to start on system start
sed -i "s/#START=yes/START=yes/" /etc/default/beanstalkd

# start Beanstalkd
service beanstalkd start
