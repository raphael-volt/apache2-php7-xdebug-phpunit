# apache2-php7-xdebug-phpunit #

Add xdebug, phpunit, pdo, sqlite3 to the official php:7-apache image.

## Goals

Provide a fast and easy way to create local devlelopment lamp-server.

## Features ##

### Live reload PhpUnit ###

```bash
# Open a bash session
docker exec -it <CONTAINER_ID> bash 
# Automaticly run tests on files changes
watch-phpunit -c specs/suite.xml
```

## Usage ##


See [sample](sample/) directory for a basic example.

# Eclipse PDT configuration #

## xdebug ##

Preferences > PHP > Debug > Debuggers 

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.debuggers.png)

### Edit configuration ###

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.xdebug.png)

## Servers ##

Preferences > PHP > Servers

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.servers.png)

### Create your server ###

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.new-server.png)

### Configure debugger ###

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.server-debugger.png)

### Configure path mapping ###

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.server-pathmapping.png)

## Debbug configurations

Run > Debbug Configurations...

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/debug.config.png)

### Create a new `PHP Web Application` configuration

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/debug.new-config.png)

### Disable `Break at first line` option
![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/debug.disable-break-first-line.png)
