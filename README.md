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

Run sample tests on files changes :

    $ cd sample
    $ docker-compose run --rm test

# Eclipse PDT configuration #

## xdebug ##

Window > Preferences > PHP > Debug > Debuggers 

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.debuggers.png)

### Edit configuration ###

Select XDebug and configure it as follows :

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.xdebug.png)

## Servers ##

Window > Preferences > PHP > Servers

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.servers.png)

### Create your server ###

Press New, configure your server as follows (adapt your document root path) and press Next.

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.new-server.png)

### Configure debugger ###

Select XDebug, configure as follows and press Next.

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.server-debugger.png)

### Configure path mapping ###

Add the following path mapping (adapt your project path) then press Finish and "Apply and Close".

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/conf.server-pathmapping.png)

## Debug configurations

Run > Debug Configurations...

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/debug.config.png)

### Create a new `PHP Web Application` configuration

Configure Server tab as follows :

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/debug.new-config.png)

### Disable `Break at first line` option

Configure Debugger tab as follows and press Debug to start the debugger.

![alt text](https://github.com/raphael-volt/apache2-php7-xdebug-phpunit/raw/master/doc/img/debug.disable-break-first-line.png)
