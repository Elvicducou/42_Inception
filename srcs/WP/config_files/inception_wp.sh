#!/bin/bash
if [ ! -f /var/www/html/wp-config.php ]; then
	echo "looping"
	while [ ! -f /var/www/html/wp-config.php ]
	do
		wp config create --allow-root --dbhost=$WORDPRESS_DB_HOST --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --path=/var/www/html
		echo "configuration ok, starting installation..."
		sleep 2
	done
	wp core install --url=vducoulo.42.fr --title=vducouloLAND --admin_user=$WORDPRESS_ADMIN_NAME --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=info@example.com --allow-root --path=/var/www/html
	wp user create $WORDPRESS_FIRSTUSER_NAME bob@example.com --allow-root --user_pass=$WORDPRESS_FIRSTUSER_PASS --role=author --path=/var/www/html
	unset MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD MYSQL_ROOT_PASSWORD WORDPRESS_ADMIN_PASS WORDPRESS_ADMIN_NAME WORDPRESS_FIRSTUSER_NAME WORDPRESS_FIRSTUSER_PASS
	echo "everything fine !"
else
	echo "already installed"
fi
	php-fpm7.3 --nodaemonize