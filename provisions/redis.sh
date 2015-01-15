z#!/usr/bin/env bash

# install Redis server
echo -e '\e[1;34mInstalling Redis...\e[0m'
apt-get install -qq redis-server

# add persistent config
tee -a /etc/redis/redis.conf << EOF
appendonly yes
appendfsync everysec
EOF

# schedule background append rewriting
if ! crontab -l | grep -q 'redis-cli bgrewriteaof'; then
    line='*/5 * * * * /usr/bin/redis-cli bgrewriteaof > /dev/null 2>&1'
    (crontab -l; echo "$line" ) | crontab -
fi

# restart Redis server
service redis-server restart
