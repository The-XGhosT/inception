#!/bin/bash

curl -O	 https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv 		 wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html



chmod -R	775 /var/www/html;

chown -R	www-data /var/www/html;

sed -i		's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
service		php7.4-fpm start

cd			/var/www/html



rm -rf		*

wp			core download --allow-root
cp			wp-config-sample.php				wp-config.php

wp			config set DB_HOST mariadb --type=constant --allow-root

sed -i -r	"s/database_name_here/${MYSQLDB}/1"	/var/www/html/wp-config.php
sed -i -r	"s/username_here/${MYSQLUSER}/1"		/var/www/html/wp-config.php
sed -i -r	"s/password_here/${MYSQLPASSWORD}/1"	/var/www/html/wp-config.php

# wp 			core install	--url=${DNAME}	-title=${WPTITLE}	--admin_user=${MYSQLUSER}			--admin_password=${MYSQLPASSWORD}	--admin_email=${WPEMAIL1} 	--skip-email	--allow-root
wp core install --url=$DNAME --title=$WPTITLE --admin_user=$WPADMIN --admin_password=$WPADMINPWD --admin_email=$WPEMAIL1 --skip-email --allow-root

wp			user create ${WPUSER} ${WPEMAIL2} --role=author --user_pass=${WPUSERPWD} --allow-root


kill		$(cat /var/run/php/php7.4-fpm.pid)

/usr/sbin/php-fpm7.4 -F
