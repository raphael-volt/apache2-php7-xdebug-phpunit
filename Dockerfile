FROM php:7-apache

LABEL maintainer "Raphaël Volt <raphael@ketmie.com>"

RUN apt-get update && apt-get install -y \
    bzip2 \
    libbz2-dev \
    libcurl4-openssl-dev \
    libsqlite3-dev \
    libxml2-dev \
    libfreetype6-dev \
    libgd-dev \
    libmcrypt-dev \
    libssl-dev \
    inotify-tools

# Install composer
RUN curl -fsSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Install php extensions
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install bz2
RUN docker-php-ext-install opcache
RUN docker-php-ext-install zip
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-install gd
RUN docker-php-ext-install intl
RUN pecl install xdebug && docker-php-ext-enable xdebug

# PHPUNIT
RUN export COMPOSER_ALLOW_SUPERUSER=1 \
    && composer global require phpunit/phpunit ^6.5 \
    && composer global require phpunit/php-invoker
ENV PATH /root/.composer/vendor/bin:$PATH

# Apache Configuration
RUN a2enmod rewrite
RUN a2enmod headers

# SSL
RUN a2enmod ssl
RUN a2ensite default-ssl
RUN openssl req -subj '/CN=example.com/O=My Company Name LTD./C=US' -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem

# xdebug configuration
COPY shared/xdebug.core.ini /usr/local/etc/php/conf.d/xdebug.core.ini

# Test watcher
RUN mkdir /shared
COPY shared/watch.phpunit.sh /shared
RUN chmod u+x,g+x /shared/watch.phpunit.sh
RUN echo "alias watch-phpunit='/shared/watch.phpunit.sh'" >> /root/.bashrc

# Change file mod and owner
RUN usermod -u 1000 www-data
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 0775 /var/www/html
