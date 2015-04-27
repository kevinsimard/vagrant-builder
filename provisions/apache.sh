#!/usr/bin/env bash

# install Apache
echo -e '\e[1;34mInstalling Apache2...\e[0m'
apt-get install -qq apache2 libapache2-mod-php5

# enable mod_rewrite
a2enmod rewrite

# clean default config files
rm /etc/apache2/sites-enabled/*
rm /etc/apache2/sites-available/*

# change /var/www owner
chown vagrant. /var/www

# set default config file
cat > /etc/apache2/sites-available/localhost.conf << EOF
<VirtualHost *:80>
    DocumentRoot /var/www/html

    <Directory /var/www/html>
        Options -Indexes
        AllowOverride All
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/localhost-error.log
    CustomLog \${APACHE_LOG_DIR}/localhost-access.log combined
</VirtualHost>
EOF

# enable default site
ln -s /etc/apache2/sites-available/localhost.conf \
    /etc/apache2/sites-enabled/localhost.conf

# restart apache2 service
service apache2 restart
