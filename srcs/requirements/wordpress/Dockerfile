FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get upgrade -y
RUN		apt-get install wget -y
RUN		apt-get install php7.3 php-fpm php-mysql mariadb-client -y
RUN		wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www/
RUN		cd /var/www/ && tar -xvf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz
RUN		mkdir -p /conf
RUN		chmod 755 /conf

COPY	conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN		chown -R root:root /var/www/wordpress

COPY	conf/index.html conf/index.html
COPY	conf/setup.sh conf/setup.sh
RUN		chmod 755 /conf/setup.sh

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod 755 wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/wp-config.php /var/www/wordpress/

ENTRYPOINT ["/bin/bash", "conf/setup.sh"]

EXPOSE 9000
