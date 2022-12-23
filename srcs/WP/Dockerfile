FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y curl php php-fpm mariadb-client less php-mysql
RUN mkdir -p /var/www /config /config/wordpress /run/php /var/run
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update
RUN wp core download --allow-root --path=/var/www/html
COPY ./config_files/inception_wp.sh /config/inception_wp.sh
RUN chmod +x /config/inception_wp.sh
RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
ENTRYPOINT ["sh", "/config/inception_wp.sh"]