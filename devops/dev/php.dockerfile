FROM php:7.4-fpm
RUN apt-get update & \
    apt-get upgrade -y & \
    apt-get install -y git zip
RUN pecl install -o -f xdebug mbstring \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable xdebug
RUN curl https://getcomposer.org/download/1.9.3/composer.phar > /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer
ENV XDEBUG_CONFIG="idekey=anything-works-here"
ENV PHP_IDE_CONFIG="serverName=Docker"
RUN useradd -m dev
WORKDIR /srv/php-scaffolding
