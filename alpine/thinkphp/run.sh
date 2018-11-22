#!/bin/sh

CONF_FILE=/etc/nginx/nginx.conf

sed -i "s/#LISTEN_PORT#/${LISTEN_PORT}/" ${CONF_FILE}

php-fpm5 -d variables_order="EGPCS" && exec nginx -g "daemon off;"

