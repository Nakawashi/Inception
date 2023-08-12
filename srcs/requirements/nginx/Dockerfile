FROM debian:buster

MAINTAINER nakawashi

RUN apt update && apt upgrade && apt install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/*
 
RUN	openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem \
	-subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42Lausanne/CN=lgenevey.42.ch" && \
	x509 -text -noout -in certificate.pem && \
	pkcs12 -inkey key.pem -in certificate.pem -export -out certificate.p12 && \
	pkcs12 -in certificate.p12 -noout -info


RUN chmod 600 /etc/ssl/lgenevey.42.ch.key

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
