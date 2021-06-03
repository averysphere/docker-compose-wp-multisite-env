FROM php:7.4-fpm-buster
ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf
RUN ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
RUN addgroup --gid 1000 wp && adduser --gid 1000 --shell /bin/sh wp
RUN mkdir -p /var/www/html
RUN chown wp:wp /var/www/html
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y libonig5 libonig-dev libcurl4 libcurl4-openssl-dev libxml2-dev libgd3 libgd-dev libpng16-16 libpng-dev libjpeg62-turbo libjpeg62-turbo-dev libfreetype6 libfreetype6-dev libmcrypt4 libmcrypt-dev
RUN docker-php-ext-install mysqli pdo pdo_mysql soap gd iconv curl mbstring && docker-php-ext-enable pdo_mysql soap gd iconv curl mbstring
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp