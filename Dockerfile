# base image
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# update packages
RUN apt-get update && \
    apt-get install -y \
      apache2 \
      libapache2-mod-php \
      poppler-utils

# Install dependencies
RUN apt-get update && apt-get -y install \
      curl \
      git \
      lsof \
      make \
      nodejs \
      node-gyp \
      npm \
      openjdk-8-jre-headless \
      unzip \
      wget \
      xvfb \
    && npm config set prefix /usr/local \
    && npm install -g gulp --silent

# update packages
# Chromium is used for pdf exports and for behat tests
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        chromium-browser \
        php-cli \
        php-curl \
        php-dom \
        php-gd \
        php-json \
        php-ldap \
        php-mbstring \
        php-pgsql \
        php-redis \
        php-xmlrpc \
        php-zip \
        php-xml

# Download Mahara
RUN curl -LO https://launchpad.net/mahara/20.10/20.10.0/+download/mahara-20.10.0.tar.bz2 && \
    tar --no-same-owner -xf mahara-20.10.0.tar.bz2 && \
    rm mahara-20.10.0.tar.bz2 && \
    rm -r /var/www/html/ && \
    cp -a mahara-20.10.0/htdocs/ -T /var/www/html/ && \
    rm -r mahara-20.10.0

# make mahara data folder
RUN install -o www-data -g www-data -d /mahara/data

COPY mahara-config.php /var/www/html/config.php

EXPOSE 80
STOPSIGNAL SIGWINCH
# Run apache to bring up Mahara
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
