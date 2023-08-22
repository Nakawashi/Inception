FROM debian:buster

MAINTAINER nakawashi

RUN apt update && apt upgrade && apt install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl/private /etc/nginx/ssl/ssl_certs

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/nginx/ssl/private/lgenevey.42.ch.key \
#     -out /etc/nginx/ssl/ssl_certs/lgenevey.42.ch.crt \
#     -subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42Lausanne/CN=lgenevey.42.ch"

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
