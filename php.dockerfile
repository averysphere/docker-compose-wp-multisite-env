#!/bin/sh
FROM php:8.0-fpm-buster
ADD ./php/www.conf /usr/local/etc/php/php.ini
RUN ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
RUN addgroup --gid 1000 wp && adduser --gid 1000 --shell /bin/sh wp
RUN mkdir /var/log/error_log
RUN mkdir -p /var/www/html
RUN chown wp:wp /var/www/html
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y vim cron libonig5 libonig-dev libcurl4 libcurl4-openssl-dev libxml2-dev libgd3 libgd-dev libpng16-16 libpng-dev libjpeg62-turbo libjpeg62-turbo-dev libfreetype6 libfreetype6-dev libmcrypt4 libmcrypt-dev
RUN docker-php-ext-install mysqli pdo pdo_mysql soap gd iconv curl mbstring && docker-php-ext-enable pdo_mysql soap gd iconv curl mbstring
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY cron.conf /etc/cron.d/wordpress_cron
RUN chmod 0644 /etc/cron.d/wordpress_cron
RUN service cron start