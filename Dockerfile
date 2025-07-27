FROM php:8.3-apache

WORKDIR /app

EXPOSE 80

RUN a2enmod rewrite

COPY /config/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN mkdir -p /var/sessions  \
    && chown www-data:www-data /var/sessions  \
    && chmod 775 /var/sessions

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get install -y sendmail libpng-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev libxpm-dev \
    libfreetype6-dev
RUN docker-php-ext-configure gd --with-jpeg --with-freetype
RUN docker-php-ext-install gd

COPY /config/php/php.ini "$PHP_INI_DIR/"