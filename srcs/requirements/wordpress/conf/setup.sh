/bin/bash

sleep 10

mv /conf/index.html /var/www/wordpress/index.html

if [ ! -e /var/www/wordpress/wp-config.php ]; then
	echo "CREATION WP-CONFIG.PHP on $DOMAIN_DATE"

	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=SQL_PASSWORD --dbhost=mariadb:3306 --path=/var/www/wordpress
	wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path=/var/www/wordpress --allow-root
	wp user create $USER1_NAME $USER1_EMAIL --role=author --user_pass=$USER1_PASSWORD --path=/var/www/wordpress --allow-root >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir /run/php
fi

/usr/sbin/php-fpm7.3 -F
