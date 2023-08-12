FROM debian:buster

MAINTAINER nakawashi

RUN apt update && apt upgrade && apt install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/*
 
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/private/$DOMAIN.key \
    -out /etc/nginx/ssl/certs/$DOMAIN.crt \
    -subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42Lausanne/CN=lgenevey.42.ch"

RUN chmod 600 /etc/ssl/lgenevey.42.ch.key

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
