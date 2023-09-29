/bin/bash

sleep 10

mv /conf/index.html /var/www/wordpress/index.html
if [ ! -d /run/php ]; then
    mkdir /run/php
fi
/usr/sbin/php-fpm7.3 -F
