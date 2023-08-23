FROM debian:buster

MAINTAINER nakawashi

RUN apt update && apt upgrade && apt install -y \
	nginx \
	openssl \
	vim \
	curl && \
	rm -rf /var/lib/apt/lists/*

# store certificate and key
RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42Lausanne/CN=lgenevey.42.ch" \
	-out /etc/nginx/ssl/certificate.crt \
	-keyout /etc/nginx/ssl/private.key

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

asdfasdf