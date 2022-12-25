FROM debian:buster
ARG WPDB_NAME
ARG WPDB_USERNAME
ARG WPDB_PASS
ARG WPDB_HOST
ENV MYSQL_DATABASE $WPDB_NAME
ENV MYSQL_PASSWORD $WPDB_PASS
ENV MYSQL_USER $WPDB_USERNAME
WORKDIR /

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server dumb-init
RUN service mysql start && mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE} ; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION ; FLUSH PRIVILEGES ;"
RUN service mysql stop
COPY ./config_files/my.cnf /etc/mysql/my.cnf
RUN service mysql start
CMD ["mysqld"]
EXPOSE 3306
RUN echo "MDB CONTAINER READY"