# PHP FPM Template for CodyChat

[![Docker Pulls](https://img.shields.io/docker/pulls/fireant456/codychat.svg)](https://hub.docker.com/r/fireant456/codychat/)
[![Docker Stars](https://img.shields.io/docker/stars/fireant456/codychat.svg)](https://hub.docker.com/r/fireant456/codychat/)
[![Docker Build](https://img.shields.io/docker/cloud/automated/fireant456/codychat)](https://hub.docker.com/r/fireant456/codychat/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/fireant456/codychat)](https://hub.docker.com/r/fireant456/codychat/)

Latest offical v7.2 [PHP-FPM](https://hub.docker.com/_/php/) container configured with basic extensions and [production settings](https://github.com/php/php-src/blob/master/php.ini-production). Includes [ionCube Loader](https://www.ioncube.com/loaders.php) php extension as required for CodyChat.

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

See [example directory](https://github.com/Fireant456/docker-codychat/tree/master/example) for sample config file showing how to use this container with [nginx](https://hub.docker.com/_/nginx/).

## Quickstart

```yml
codychat:
  image: fireant456/codychat

  volumes:
    # Website files
    - ./www:/www

  ports:
    - "9000:9000"
```

You will need to supply the CodyChat files and replace the index.php file in the www directory in the [example directory](https://github.com/Fireant456/docker-codychat/tree/master/example). Once you do this, connecting to your server on port 80 should give you CodyChat. If you do not supply the files downloaded from the CodyChat website then you should see the PHP test page.
