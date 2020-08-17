# PHP FPM Template for WHMCS

[![Docker Pulls](https://img.shields.io/docker/pulls/fireant456/whmcs/.svg)](https://hub.docker.com/r/fireant456/whmcs/)
[![Docker Stars](https://img.shields.io/docker/stars/fireant456/whmcs/.svg)](https://hub.docker.com/r/fireant456/whmcs/)
[![Docker Build](https://img.shields.io/docker/automated/fireant456/whmcs/.svg)](https://hub.docker.com/r/fireant456/whmcs/)
[![Docker Build Status](https://img.shields.io/docker/build/fireant456/whmcs/.svg)](https://hub.docker.com/r/fireant456/whmcs/)

Latest offical [PHP-FPM](https://hub.docker.com/_/php/) container configured with basic extensions and [production settings](https://github.com/php/php-src/blob/master/php.ini-production). Includes [ionCube Loader](https://www.ioncube.com/loaders.php) php extension as required for WHMCS.

## Changes to offical container

### Extentions

- pdo_mysql
- mysqli
- calendar
- intl
- ionCube Loader

### php.ini

- date.timezone = Etc/UTC
- upload_max_filesize = 25M
- post_max_size = 25M

## Configuration

See [example directory](https://github.com/Fireant456/docker-WHMCS/tree/master/example) for sample config file showing how to use this container with [nginx](https://hub.docker.com/_/nginx/).

## Quickstart

```yml
whmcs:
  image: fireant456/whmcs

  volumes:
    # Website files
    - ./www:/www

  ports:
    - "9000:9000"
```
