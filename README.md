# docker-php-composer
Specific versions of PHP and composer

Can be used to generate the 'vendor' dir for development environments

```
docker run --rm -v $(pwd):/var/php-composer -u="1000:1000" taprohm/php-composer:8.1.8-2.x install --no-cache
```

or as a base image to produce the 'vendor' dir for multistage builds

```
FROM taprohm/php-composer:8.1.8-2.x AS vendor
COPY composer.json composer.lock ./
RUN composer install

FROM some-image:some-tag
COPY --from=vendor /var/php-composer/vendor .
```
