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

