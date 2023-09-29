# syntax=docker/dockerfile:1

FROM debian:buster

RUN	apt-update
RUN	apt-upgrade
RUN	apt-get install nginx
RUN	apt-get install openSSL

RUN	mkdir -p /etc/nginx/ssl/cert
RUN	mkdir -p /etc/nginx/ssl/private
RUN	mkdir -p /var/run/nginx

RUN	openssl req -newkey rsa:4096 -days 42 -nodes -x509 -out /etc/nginx/ssl/cerst/inception.crt -keyout /etc/nginx/ssl/private/inception.key -subj "/C=FR/ST=Perpigna/L=Perpignan/O=42/OU=42Perpignan/CN=rrodor.42.fr/UID=rrodor"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/ww/html
RUN	chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
