#!/usr/bin/env bash

# install Apache
echo -e "\e[1;34mInstalling Apache2...\e[0m"
apt-get install -qq apache2

# clean default config files
rm /etc/apache2/sites-enabled/*
rm /etc/apache2/sites-available/*

# set default config file
cat > /etc/apache2/sites-available/localhost << EOF
<VirtualHost *:80>
    ServerName localhost
    ServerAlias www.localhost.com
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www

    <Directory /var/www>
        Options -Indexes +FollowSymLinks +MultiViews
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/localhost-error.log
    CustomLog \${APACHE_LOG_DIR}/localhost-access.log combined
</VirtualHost>
EOF

# enable default site
ln -s /etc/apache2/sites-available/localhost \
    /etc/apache2/sites-enabled/localhost

# restart apache2 service
service apache2 restart
