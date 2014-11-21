FROM maxexcloo/nginx:latest
MAINTAINER Qi Zhang <todayhill@gmail.com>
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E
RUN echo "deb http://packages.dotdeb.org/ wheezy-php55 all" > /etc/apt/sources.list.d/php.list
RUN apt-get update
RUN apt-get install -y php5-cli php5-curl php5-fpm php5-gd php5-mcrypt php5-mysql php5-pgsql php5-sqlite git php5-dev libpcre3-dev gcc make
RUN rm -rf /etc/nginx/addon.d /etc/php5/fpm/pool.d
RUN mkdir -p /etc/nginx/addon.d /etc/php5/fpm/pool.d
ADD etc /etc
ADD supervisord.conf /etc/supervisor/conf.d/php-fpm.conf
WORKDIR /tmp
RUN git clone git://github.com/phalcon/cphalcon.git;cd cphalcon/build;./install;echo "extension=phalcon.so">>/etc/php5/fpm/php.ini;echo "extension=phalcon.so">>/etc/php5/cli/php.ini
