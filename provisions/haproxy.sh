#!/usr/bin/env bash

# install HAProxy
apt-get install -y haproxy

# enable HAProxy via init script
sed -i "s/ENABLED=0/ENABLED=1/" /etc/default/haproxy

# start HAProxy service
service haproxy start
