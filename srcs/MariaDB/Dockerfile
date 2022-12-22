FROM debian:buster
WORKDIR /

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server dumb-init
RUN service mysql start && mysql -u root -e "CREATE DATABASE wordpress_db; \
	GRANT ALL ON wordpress_db.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password'; \
	FLUSH PRIVILEGES;"
CMD ["mysqld"]
EXPOSE 3306
RUN echo "MDB CONTAINER READY"