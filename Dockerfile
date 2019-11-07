FROM php:7.3.10-apache

MAINTAINER Erik Tonon <https://www.linkedin.com/in/erik-tonon-83817b145/>

RUN apt-get update && apt-get install -y \
    git \
    zlib1g-dev \
    unzip \
    unixodbc \
    unixodbc-dev \
    freetds-dev \
    freetds-bin \
    tdsodbc \
    libxml2-dev \
    libicu-dev \
    locales-all \
    task-brazilian-portuguese \
    ghostscript \
    libaio-dev \
    unixodbc \
    tdsodbc \
    libzip-dev \
    && docker-php-ext-install zip


# Set timezone
RUN rm /etc/localtime &&\
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime &&\
    "date"


# xDEBUG testing
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo 'xdebug.remote_enable=on' >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo 'xdebug.remote_host=10.0.75.1' >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo 'xdebug.remote_port=9000' >> /usr/local/etc/php/conf.d/xdebug.ini \
    && a2enmod rewrite

#Postgres Driver
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libpng-dev \
    zip unzip \
    git \
    iputils-ping && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install pdo pdo_pgsql pgsql && \
    docker-php-ext-install gd


#Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite \
    && a2enmod headers


# SOAP api extension
RUN docker-php-ext-install soap \
    && docker-php-ext-install pdo intl mbstring \
    && docker-php-ext-configure pdo_dblib --with-libdir=/lib/x86_64-linux-gnu

#XDEBUG
RUN docker-php-ext-install pdo_dblib \
    && docker-php-ext-enable intl mbstring pdo_dblib
