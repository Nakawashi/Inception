FROM debian:buster

MAINTAINER nakawashi <l.genevey@gmail.com>

# Update packages and install MariaDB
RUN apt update && apt upgrade && apt install -y \
	mariadb-server \
	vim \
	&& rm -rf /var/lib/apt/lists/*

# Copy the server configuration file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/start.sh /start.sh

EXPOSE 3306

#ENTRYPOINT ["bash", "start.sh"]


CMD ["sh", "/start.sh"]
