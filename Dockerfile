FROM php:7-apache

ARG OWA_VERSION=1.7.7

RUN cd /tmp \
   && docker-php-ext-configure mysqli \
   && docker-php-ext-install mysqli \
   && curl -LO https://github.com/Open-Web-Analytics/Open-Web-Analytics/releases/download/$OWA_VERSION/owa_${OWA_VERSION}_packaged.tar \ 
   && tar -xf owa_${OWA_VERSION}_packaged.tar -C /var/www/html/ \
   && rm owa_${OWA_VERSION}_packaged.tar

USER 1001:121

ADD --chown=1001:121 owa-config.php /var/www/html/owa-config.php

