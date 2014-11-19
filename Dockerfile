FROM maxexcloo/nginx-php:latest
MAINTAINER Qi Zhang <todayhill@gmail.com>

RUN apt-get update
RUN apt-get remove php5-fpm -y
RUN apt-get install git php5-dev libpcre3-dev gcc make -y
WORKDIR /tmp
RUN git clone git://github.com/phalcon/cphalcon.git
WORKDIR /tmp/cphalcon/build
RUN ./install
RUN echo "extension=phalcon.so">>/etc/php5/fpm/php.ini;echo "extension=phalcon.so">>/etc/php5/cli/php.ini

