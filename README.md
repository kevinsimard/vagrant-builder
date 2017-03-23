# Dynamic Vagrant Machines

## Installation

> This structure utilizes [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) to create virtual machines. So, before using it, you will need to make sure you have both of them installed on your machine.

Edit the macines.yml file to customize your machine(s).

```yml
-
    ip: "192.168.10.10"
    cpus: 1
    swap: 2048
    memory: 1024
    hostname: web1
    provisions:
        php:
        composer:
        node:
        mysql:
        nginx:
    ports:
        - send: 8080
          to: 80
    folders:
        - map: ~/Server
          to: /var/www
...
```

> Available Provisions
* **_apache_**
* **_beanstalkd_**
* **_composer_**
* **_haproxy_**
* **_memcached_**
* **_mongodb_**
* **_mysql_**
* **_nginx_**
* **_node_**
* **_php_**
* **_redis_**
* **_rvm_**
* **_supervisord_**

Run the following command to create/start your machine(s).

```bash
$ vagrant up
```

Run the following command to reprovision your machine(s).

```bash
$ vagrant provision
```

## Code Structure

    ├── provisions
    │   ├── scripts
    │   │   ├── post.sh
    │   │   ├── pre.sh
    │   │   └── swap.sh
    │   ├── apache.sh
    │   ├── beanstalkd.sh
    │   ├── composer.sh
    │   ├── haproxy.sh
    │   ├── memcached.sh
    │   ├── mongodb.sh
    │   ├── mysql.sh
    │   ├── nginx.sh
    │   ├── node.sh
    │   ├── php.sh
    │   ├── redis.sh
    │   ├── rvm.sh
    │   └── supervisord.sh
    ├── .editorconfig
    ├── .gitattributes
    ├── .gitignore
    ├── LICENSE.md
    ├── README.md
    ├── Vagrantfile
    └── machines.yml

## License

This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
