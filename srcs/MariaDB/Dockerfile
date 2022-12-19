FROM debian:buster
WORKDIR /

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server dumb-init
CMD ["mysql", "-u", "root"]
EXPOSE 3306
RUN echo "MDB CONTAINER READY"