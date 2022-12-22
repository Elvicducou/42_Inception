FROM debian:buster

ARG WPDB_NAME
ARG WPDB_USERNAME
ARG WPDB_PASS
ARG WPDB_HOST
ENV WORDPRESS_DB_NAME $WPDB_NAME
ENV WORDPRESS_DB_HOST $WPDB_HOST
ENV WORDPRESS_DB_PASSWORD $WPDB_PASS
ENV WORDPRESS_DB_USER $WPDB_USERNAME

RUN apt update -y && apt upgrade -y
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y curl php php-fpm mariadb-client less php-mysql
RUN mkdir /var/www && mkdir /config
#RUN curl -O https://wordpress.org/latest.tar.gz
#RUN tar -xvf latest.tar.gz -C /var/www
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update
RUN wp core download --allow-root --path=/var/www/html/
COPY ./config_files/inception_wp.sh /config/inception_wp.sh
RUN chmod +x /config/inception_wp.sh
#RUN wp config create --allow-root --dbhost=$WORDPRESS_DB_HOST --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --path=/var/www/html/
#RUN wp core install --url=vducoulo.42.fr --title=Example --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com
#ENTRYPOINT ["sh", "/config/inception_wp.sh"]