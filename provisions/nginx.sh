#!/usr/bin/env bash

# install Nginx
echo -e "\e[1;34mInstalling Nginx...\e[0m"
apt-get install -qq nginx

# turn off sendfile to be more compatible with Windows
sed -i "s/sendfile on;/sendfile off;/" /etc/nginx/nginx.conf

# set set hash bucket size to 64
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 64;/" /etc/nginx/nginx.conf

# restart Nginx service
service nginx restart
