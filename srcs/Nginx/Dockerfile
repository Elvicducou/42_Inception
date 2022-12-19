FROM debian:buster
WORKDIR /

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx openssl
RUN openssl genrsa -out /etc/ssl/private/private.key 2048
RUN mkdir /etc/ssl/csr/
RUN openssl req -new -key /etc/ssl/private/private.key -out /etc/ssl/csr/csr.pem -subj "/C=FR"
RUN openssl x509 -req -days 365 -in /etc/ssl/csr/csr.pem -signkey /etc/ssl/private/private.key -out /etc/ssl/certs/public.crt
RUN mkdir ./config
RUN echo "server { \
listen 443 ssl;\
server_name vducoulo.42.fr;\
ssl_certificate /etc/ssl/certs/public.crt;\
ssl_certificate_key /etc/ssl/private/private.key;\
ssl_protocols TLSv1.3;\
}" > ./config/nginx.conf
RUN cp ./config/nginx.conf /etc/nginx/conf.d
CMD ["nginx", "-g",  "daemon off;"]
EXPOSE 443
RUN echo "NGINX CONTAINER READY"