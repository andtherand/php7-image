## Basic PHP container for development purposes

The image is derived from my [docker-webbase](https://github.com/mychiara/docker-webbase) image.

It' s using PHP 7 and installs some very basic PHP modules.

### PHP modules

* php7-cli 
* php7-dev 
* php7-apcu 
* php7-json 
* php7-pgsql 
* php7-mysql 
* php7-mongo 
* php7-sqlite 
* php7-mcrypt  
* php7-ldap 
* php7-intl 
* php7-gd 
* php7-curl 
* php7-readline 

It also includes composer and uses php-fpm by default so it's well suited for usage in conjunction with nginx fastcgi.

## Logging

The logging is redirected to stdout so that the container is aware of what's happening and we have easy access to the logs without the need to log into the running container.

## Volumes

The image sets the ```/app-src``` volume to be able to access project code from a host or be overiden by a [data-container](https://medium.com/@ramangupta/why-docker-data-containers-are-good-589b3c6c749e).