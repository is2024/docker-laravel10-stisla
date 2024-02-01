FROM php:8.3.2-fpm-alpine3.19
WORKDIR /var/www/html

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

ADD ./laravel10-stisla/ /var/www/html

RUN apk add --no-cache $PHPIZE_DEPS \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libxpm-dev \
    libzip-dev \
    gettext-dev \
    oniguruma-dev

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-install pdo pdo_mysql gettext gd

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd

RUN chown -R laravel:laravel /var/www/html