FROM php:7.2-fpm

# Install extensions
RUN set -xe \
	&& apt-get update \
	&& apt-get install -y libicu-dev --no-install-recommends \
	&& apt-get install -y zlib1g-dev \
		libfreetype6-dev \
        libmagickwand-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libzip-dev \
        jpegoptim \
        optipng \
        gifsicle \
        sendmail \
        git-core \
        build-essential \
        openssl \
        libssl-dev \
        libonig-dev \
        python2.7 \
        zip \
        cron \
        libc-client-dev \
        libkrb5-dev \
	&& docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
	&& docker-php-ext-install -j$(nproc) pdo_mysql mysqli calendar intl \
	&& docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap soap xmlrpc zip \
	&& apt-get purge -y --auto-remove libicu-dev \
	&& rm -rf /var/lib/apt/lists/*

# Configure production php.ini
RUN curl -sS https://raw.githubusercontent.com/php/php-src/master/php.ini-production \
	| sed -e 's/^;\(date.timezone.*\)/\1 \"Etc\/UTC\"/' \
	-e 's/^\(upload_max_filesize =\).*/\1 25M/' \
	-e 's/^\(post_max_size =\).*/\1 25M/' \
	> /usr/local/etc/php/php.ini

# ioncube loader
RUN curl -o ioncube.tar.gz "http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz" \
    && mkdir -p ioncube \
    && tar -xf ioncube.tar.gz -C ioncube --strip-components=1 \
    && mv ioncube/ioncube_loader_lin_7.2.so `php-config --extension-dir` \
    && rm -Rf ioncube.tar.gz ioncube \
    && docker-php-ext-enable ioncube_loader_lin_7.2
