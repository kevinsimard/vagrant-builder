#!/usr/bin/env bash

# set username and password of MySQL to 'root' when prompt
echo -e "\e[1;34mWARNING: MySQL default password: 'root'\e[0m"
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

# install MySQL server
echo -e "\e[1;34mInstalling MySQL...\e[0m"
apt-get install -qq mysql-server

# enable remote access to MySQL from everywhere
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# grant privileges to root user from everywhere
MYSQL=`which mysql`
Q1="GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"
Q2="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}"
$MYSQL -uroot -proot -e "$SQL"

# restart MySQL service
service mysql restart
