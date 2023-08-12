FROM debian:buster

MAINTAINER nakawashi

# Update packages and install MariaDB
RUN apt update && apt upgrade && apt install -y \
	mariadb-server \
	vim

# Copy the server configuration file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["sh", "./tools/start.sh]
