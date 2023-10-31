/bin/bash

sleep 10

mv /conf/index.html /var/www/wordpress/index.html

wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path=/var/www/wordpress --allow-root
wp user create $USER1_NAME $USER1_EMAIL --role=author --user_pass=$USER1_PASSWORD --path=/var/www/wordpress --allow-root >> /log.txt

if [ ! -d /run/php ]; then
    mkdir /run/php
fi

/usr/sbin/php-fpm7.3 -F
