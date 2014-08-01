#!/usr/bin/env bash

# install Nginx
apt-get install -y nginx

# turn off sendfile to be more compatible with Windows
sed -i "s/sendfile on;/sendfile off;/" /etc/nginx/nginx.conf

# set set hash bucket size to 64
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 64;/" /etc/nginx/nginx.conf

# restart Nginx service
service nginx restart
