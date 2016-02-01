#!/usr/bin/env docker

FROM mychiara/webbase:1.0.0
MAINTAINER Andy Ruck mychiara+docker   ___at___   gmail com

RUN apt-get install -y language-pack-en-base && \
    LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php-7.0 && \

    apt-get update && \

    apt-get install --no-install-recommends -yq \
    build-essential \
    imagemagick \
    ca-certificates \
    php7.0-cli \
    php7.0-dev \
    php7.0-mysql \
    php7.0-gd \
    php7.0-curl \
    php7.0-sqlite \
    php7.0-intl \
    php7.0-common \
    php7.0-json \
    php7.0-opcache \
    php7.0-fpm && \

    curl https://getcomposer.org/installer | php -- && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer && \
    mkdir -p /var/log/php && ln -sf /dev/stdout /var/log/php/error.log && ln -sf /dev/stdout /var/log/php7-fpm.log && \

    apt-get autoclean && apt-get -y autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/phpredis/phpredis.git && \
    cd phpredis && \
    git checkout php7 && \
    phpize && \
    ./configure && \
    make && make install && \
    cd .. && \
    rm -rf phpredis

# Copy local .inis to the image
COPY files/php.ini /etc/php7/fpm/php.ini
COPY files/php-cli.ini /etc/php7/cli/php.ini
COPY files/php-fpm.conf /etc/php7/fpm/php-fpm.conf

# init system
RUN mkdir -p /etc/service/php-fpm /var/run/php-fpm
ADD /files/start.sh /etc/service/php-fpm/run
RUN chmod +x /etc/service/php-fpm/run

VOLUME "/app-src"

EXPOSE 9000