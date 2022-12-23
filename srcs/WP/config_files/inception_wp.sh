#!/bin/bash
if [ ! -f /var/www/html/index.php]
then
	while [ ! -f /var/www/wordpress/wp-config.php]
	do
		wp config create --allow-root --dbhost=$WORDPRESS_DB_HOST --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --path=/var/www/html
		echo "maybe it's installed ..."
		sleep 2
	done
	wp core install --url=vducoulo.42.fr --title=Example --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com --allow-root --path=/var/www/html
	echo "everything fine !!!!"
	sleep infinity
fi

	echo "already installed"
	sleep infinity
