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

# make mahara data folder
RUN mkdir -p /mahara/data && \
    chmod 777 /mahara/data
EXPOSE 80
# Run apache to bring up Mahara
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]