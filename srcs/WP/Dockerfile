FROM debian:buster
WORKDIR /

RUN apt update -y && apt upgrade -y
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y curl php php-fpm mariadb-client less
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update
EXPOSE 80
RUN echo "WP CONTAINER READY"