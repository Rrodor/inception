FROM	debian:buster

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install mariadb-server -y

RUN	mkdir -p /conf && chmod 755 /conf

COPY	/conf/initDataBase.sh /conf
COPY	/conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/bin/bash","./conf/initDataBase.sh"]

EXPOSE	3306
