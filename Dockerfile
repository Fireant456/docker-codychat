FROM php:fpm

# Install useful extensions
RUN deps="libicu52 curl"; \
	build_deps="libicu-dev"; \
	set -x \
	&& apt-get update && apt-get install -y $deps $build_deps --no-install-recommends \
	&& docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
	&& docker-php-ext-install -j$(nproc) calendar \
	&& docker-php-ext-install -j$(nproc) pdo_mysql mysqli \
	&& docker-php-ext-install -j$(nproc) intl \
	&& apt-get purge -y --auto-remove $build_deps \
	&& rm -rf /var/lib/apt/lists/*

# Configure default php.ini
RUN curl -sS https://raw.githubusercontent.com/php/php-src/master/php.ini-production \
	| sed -e 's/^;\(date.timezone.*\)/\1 \"Etc\/UTC\"/' \
	-e 's/^\(upload_max_filesize =\).*/\1 25M/' \
	-e 's/^\(post_max_size =\).*/\1 25M/' \
	> /usr/local/etc/php/php.ini

# Set number of FPM children
RUN sed -i 's/^\(pm.max_children =\).*/\1 16/' /usr/local/etc/php-fpm.conf

# Include GeoIP database
RUN mkdir -p /usr/share/GeoIP && curl -sS http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz | gzip -d > /usr/share/GeoIP/GeoLite2-City.mmdb
