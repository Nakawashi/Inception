FROM debian:buster

MAINTAINER nakawashi

RUN apt update && apt upgrade && apt install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/*
 
#Generate a self certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/lgenevey.42.ch.pem -keyout /etc/ssl/lgenevey.42.ch.key -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=lgenevey/CN=lgenevey.42.ch"

#Copy the new configuration inside nginx
COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
