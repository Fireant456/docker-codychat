# PHP FPM Template for WHMCS

[![Docker Pulls](https://img.shields.io/docker/pulls/fireant456/whmcs.svg)](https://hub.docker.com/r/fireant456/whmcs/)
[![Docker Stars](https://img.shields.io/docker/stars/fireant456/whmcs.svg)](https://hub.docker.com/r/fireant456/whmcs/)
[![Docker Build](https://img.shields.io/docker/cloud/automated/fireant456/whmcs)](https://hub.docker.com/r/fireant456/whmcs/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/fireant456/whmcs)](https://hub.docker.com/r/fireant456/whmcs/)

Latest offical v7.3 [PHP-FPM](https://hub.docker.com/_/php/) container configured with basic extensions and [production settings](https://github.com/php/php-src/blob/master/php.ini-production). Includes [ionCube Loader](https://www.ioncube.com/loaders.php) php extension as required for WHMCS.

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

If using this container for WHMCS I suggest also adding my [Cron container](https://github.com/Fireant456/docker-PHP-Cron/) to your docker stack in order to enable required WHMCS automation. Alternatively you can add a cron job to your host machine like the following...

`/etc/cron.d/whmcs`

```
*/5 * * * * root /usr/bin/docker exec whmcs_whmcs_1 /usr/local/bin/php -q /var/www/html/crons/cron.php

```

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

You will need to supply the WHMCS files and replace the index.php file in the www directory in the [example directory](https://github.com/Fireant456/docker-WHMCS/tree/master/example). Once you do this, connecting to your server on port 80 should give you WHMCS. If you do not supply the files downloaded from the WHMCS website then you should see the PHP test page.
