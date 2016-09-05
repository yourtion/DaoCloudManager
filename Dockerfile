# This dockerfile uses the php:7-apache image
# VERSION 1 - EDITION 1
# Author: Yourtion Guo <yourtion@gmail.com>

FROM php:7-apache

# phpRedisAdmin

ENV RVERSION 1.6.0
ENV RURL https://github.com/erikdubbelboer/phpRedisAdmin/archive/v${RVERSION}.tar.gz

RUN set -x \
    && curl --output phpRedisAdmin.tar.gz --location $RURL \
    && tar xzf phpRedisAdmin.tar.gz \
    && rm -f phpRedisAdmin.tar.gz \
    && mkdir /var/www/html/phpRedisAdmin \
    && mv phpRedisAdmin-${RVERSION}/* /var/www/html/phpRedisAdmin/ \
    && rm -rf phpRedisAdmin-${RVERSION}

# predis

ENV PVERSION 1.1.1
ENV PURL https://github.com/nrk/predis/archive/v${PVERSION}.tar.gz

RUN set -x \
    && curl --output predis.tar.gz --location $PURL \
    && tar xzf predis.tar.gz \
    && rm -f predis.tar.gz \
    && mkdir /var/www/html/phpRedisAdmin/vendor/ \
    && mv predis-${PVERSION}/* /var/www/html/phpRedisAdmin/vendor/ \
    && rm -rf predis-${PVERSION}

# phpMyAdmin

ENV MVERSION 4.6.4
ENV MURL https://files.phpmyadmin.net/phpMyAdmin/${MVERSION}/phpMyAdmin-${MVERSION}-all-languages.tar.gz

RUN set -x \
    && curl --output phpMyAdmin.tar.gz --location $MURL \
    && tar xzf phpMyAdmin.tar.gz \
    && rm -f phpMyAdmin.tar.gz \
    && mv phpMyAdmin* /var/www/html/phpMyAdmin \
    && rm -rf /var/www/html/phpMyAdmin/js/jquery/src/ /var/www/html/phpMyAdmin/js/openlayers/src/ /var/www/html/phpMyAdmin/setup/ /var/www/html/phpMyAdmin/sql/ /var/www/html/phpMyAdmin/examples/ /var/www/html/phpMyAdmin/test/ /var/www/html/phpMyAdmin/po/

# MySQL Ext

RUN docker-php-ext-install mysqli

# phpPgAdmin

ENV GVERSION 5-1-0
ENV RURL https://github.com/phppgadmin/phppgadmin/archive/REL_${GVERSION}.tar.gz

RUN set -x \
    && curl --output phpPgAdmin.tar.gz --location $RURL \
    && tar xzf phpPgAdmin.tar.gz \
    && rm -f phpPgAdmin.tar.gz \
    && mkdir /var/www/html/phpPgAdmin \
    && mv phppgadmin-REL_${GVERSION}/* /var/www/html/phpPgAdmin/ \
    && rm -rf phppgadmin-REL_${GVERSION}

COPY config/phpPgAdmin.php /var/www/html/phpPgAdmin/conf/config.inc.php

