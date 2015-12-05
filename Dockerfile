FROM php:5.6-fpm

RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

RUN apt-get update -y && \
    apt-get install -y \
    php5-curl \
    php5-gd \
    php5-geoip \
    php5-imagick \
    php5-imap \
    php5-json \
    php5-ldap \
    libmcrypt-dev \
    php5-mcrypt \
    php5-memcache \
    php5-memcached \
    php5-mongo \
    php5-mssql \
    php5-mysqlnd \
    php5-pgsql \
    php5-redis \
    sqlite \
    libsqlite3-0 \
    libsqlite3-dev \
    php5-sqlite \
    php5-xdebug \
    php5-xmlrpc \
    php5-xcache \
    openssl

RUN docker-php-ext-install mbstring pdo_mysql pdo_sqlite mcrypt

COPY php.ini /usr/local/etc/php/
