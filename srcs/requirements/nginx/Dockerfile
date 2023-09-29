# syntax=docker/dockerfile:1

FROM debian:buster

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install nginx -y
RUN	apt-get install openssl -y

RUN	mkdir -p /etc/nginx/ssl/certs
RUN	mkdir -p /etc/nginx/ssl/private
RUN	mkdir -p /var/run/nginx

RUN	openssl req -newkey rsa:4096 -days 42 -nodes -x509 -out /etc/nginx/ssl/certs/inception.crt -keyout /etc/nginx/ssl/private/inception.key -subj "/C=FR/ST=Perpignan/L=Perpignan/O=42/OU=42Perpignan/CN=rrodor.42.fr/UID=rrodor"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/www/html
RUN	chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
