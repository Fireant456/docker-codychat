# PHP FPM Container

[![Docker Pulls](https://img.shields.io/docker/pulls/joebiellik/php.svg)](https://hub.docker.com/r/joebiellik/php/)
[![Docker Stars](https://img.shields.io/docker/stars/joebiellik/php.svg)](https://hub.docker.com/r/joebiellik/php/)
[![Docker Build](https://img.shields.io/docker/automated/joebiellik/php.svg)](https://hub.docker.com/r/joebiellik/php/)
[![Docker Build Status](https://img.shields.io/docker/build/joebiellik/php.svg)](https://hub.docker.com/r/joebiellik/php/)

Latest offical [PHP-FPM](https://hub.docker.com/_/php/) container configured with basic extensions and [production settings](https://github.com/php/php-src/blob/master/php.ini-production).

## Changes to offical container

### Extentions

- pdo_mysql
- mysqli
- calendar
- intl

### php.ini

- date.timezone = Etc/UTC
- upload_max_filesize = 25M
- post_max_size = 25M

## Configuration

See [example directory](https://github.com/jcbiellikltd/docker-dhcpd/tree/master/example) for sample config file showing how to use this container with [nginx](https://hub.docker.com/_/nginx/).

## Quickstart

```yml
php:
  image: joebiellik/php

  volumes:
    # Website files
    - ./www:/www

  ports:
    - "9000:9000"
```
