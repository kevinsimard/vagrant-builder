#!/usr/bin/env bash

if ! which php > /dev/null; then
    # install PHP5-CLI/FPM
    apt-get install -y php5-cli php5-fpm

    # install PHP5 extensions
    apt-get install -y php5-mysql php5-pgsql php5-sqlite\
        php5-curl php5-gd php5-mcrypt php5-xdebug php5-memcached

    # set PHP5-FPM to listen on TCP instead of Socket
    sed -i "s/listen =.*/listen = 127.0.0.1:9000/" /etc/php5/fpm/pool.d/www.conf

    # set run-as user for PHP5-FPM processes to user/group "vagrant"
    # to avoid permission errors from apps writing to files
    sed -i "s/user = www-data/user = vagrant/" /etc/php5/fpm/pool.d/www.conf
    sed -i "s/group = www-data/group = vagrant/" /etc/php5/fpm/pool.d/www.conf
    sed -i "s/listen\.owner.*/listen.owner = vagrant/" /etc/php5/fpm/pool.d/www.conf
    sed -i "s/listen\.group.*/listen.group = vagrant/" /etc/php5/fpm/pool.d/www.conf
    sed -i "s/listen\.mode.*/listen.mode = 0666/" /etc/php5/fpm/pool.d/www.conf

    # set xdebug config
    cat > $(find /etc/php5 -name xdebug.ini) << EOF
zend_extension=$(find /usr/lib/php5 -name xdebug.so)
xdebug.remote_enable = 1
xdebug.remote_connect_back = 1
xdebug.remote_port = 9000
xdebug.scream=0
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF
fi
