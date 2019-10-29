FROM php:7.2.13-fpm
USER root

RUN apt-get update && apt-get install -qy git curl libmcrypt-dev mysql-client libzip-dev zip
RUN yes | pecl install mcrypt-1.0.1
RUN docker-php-ext-configure zip --with-libzip && docker-php-ext-install pdo_mysql pcntl exif zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
