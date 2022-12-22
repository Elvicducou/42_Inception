FROM debian:buster
WORKDIR /

RUN apt update -y && apt upgrade -y
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y curl php php-fpm mariadb-client
RUN curl -O https://wordpress.org/latest.tar.gz
RUN	tar -xvf latest.tar.gz
RUN rm -rf latest.tar.gz
EXPOSE 80
RUN echo "WP CONTAINER READY"