## Basic PHP container for development purposes

The image is derived from my [docker-webbase](https://github.com/mychiara/docker-webbase) image.

It' s using PHP 7 and installs some very basic PHP modules.

### PHP modules

* php7.0 
* php7.0-cli 
* php7.0-dev 
* php7.0-fpm 
* php7.0-bcmath 
* php7.0-bz2 
* php7.0-mysql 
* php7.0-mbstring 
* php7.0-mcrypt 
* php7.0-ldap 
* php7.0-gd 
* php7.0-curl 
* php7.0-sqlite 
* php7.0-intl 
* php7.0-common 
* php7.0-json 
* php7.0-opcache 
* php7.0-recode 
* php7.0-xml 
* php7.0-zip 

It also includes composer and uses php-fpm by default so it's well suited for usage in conjunction with nginx fastcgi.

## Logging

The logging is redirected to stdout so that the container is aware of what's happening and we have easy access to the logs without the need to log into the running container.
Also the fpm log level is currently set to debug.

## Volumes

The image sets the ```/app-src``` volume to be able to access project code from a host or be overiden by a [data-container](https://medium.com/@ramangupta/why-docker-data-containers-are-good-589b3c6c749e).