FROM debian:buster
WORKDIR /

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx openssl
RUN openssl genrsa -out /etc/ssl/private/private.key 2048
RUN mkdir /etc/ssl/csr/
RUN openssl req -new -key /etc/ssl/private/private.key -out /etc/ssl/csr/csr.pem -subj "/C=FR"
RUN openssl x509 -req -days 365 -in /etc/ssl/csr/csr.pem -signkey /etc/ssl/private/private.key -out /etc/ssl/certs/public.crt
RUN mkdir -p ./config
COPY ./config_files/inception_nginx.conf ./config/
RUN cp ./config/inception_nginx.conf /etc/nginx/conf.d
#RUN rm /var/wwww/html/index.nginx-debian.html
CMD ["nginx", "-g",  "daemon off;"]
EXPOSE 443
RUN echo "NGINX CONTAINER READY"