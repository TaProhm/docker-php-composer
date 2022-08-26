FROM php:8.1.8-cli-alpine3.16
WORKDIR /var/php-composer
COPY install-composer.sh .
ENV COMPOSER_IGNORE_PLATFORM_REQ="ext-*"
RUN chmod +x install-composer.sh \
    && ./install-composer.sh \
    && rm install-composer.sh \
    && mv composer.phar /usr/local/bin/composer
ENTRYPOINT ["composer"]