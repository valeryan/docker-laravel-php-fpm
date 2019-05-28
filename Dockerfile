FROM php:7.2-fpm

RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

RUN apt-get update -y && \
    apt-get install -y \
    libmcrypt-dev \
    sqlite \
    libsqlite3-0 \
    libsqlite3-dev \
    openssl \
    libicu-dev \
    libpng-dev

#install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs

RUN docker-php-ext-install mbstring pdo_mysql pdo_sqlite gd intl bcmath zip

COPY php.ini /usr/local/etc/php/
