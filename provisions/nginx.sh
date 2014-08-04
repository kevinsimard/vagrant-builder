#!/usr/bin/env bash

# install Nginx
echo -e "\e[1;34mInstalling Nginx...\e[0m"
apt-get install -qq nginx

# turn off sendfile to be more compatible with Windows
sed -i "s/sendfile on;/sendfile off;/" /etc/nginx/nginx.conf

# set set hash bucket size to 64
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 64;/" /etc/nginx/nginx.conf

# clean default config files
rm /etc/nginx/sites-enabled/*
rm /etc/nginx/sites-available/*

# create web root directory
mkdir /var/www && chown vagrant. /var/www

# set default config file
cat > /etc/nginx/sites-available/localhost << EOF
server {
    listen 80;
    server_name localhost www.localhost.com;

    charset utf-8;
    root /var/www;
    index index.html index.php;

    sendfile off;
    error_page 404 /index.php;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log /var/log/nginx/localhost-access.log;
    error_log  /var/log/nginx/localhost-error.log error;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

# enable default site
ln -s /etc/nginx/sites-available/localhost \
    /etc/nginx/sites-enabled/localhost

# restart Nginx service
service nginx restart
