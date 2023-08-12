FROM alpine:3.18.3

MAINTAINER nakawashi

# Set env variables inside container
ENV MYSQL_ROOT_PASSWORD rootpassword
ENV MYSQL_DATADIR /var/lib/mysql

# Update packages and install MariaDB
RUN apk update && \
    apk add mariadb mariadb-client && \
    rm -rf /var/cache/apk/*

# Copy the server configuration file
#COPY ./conf/my-custom.cnf /etc/my.cnf

# Set MariaDB data dir and log dir
RUN mkdir -p /var/lib/mysql && \
	mkdir -p /var/log/mysql && \
	chown mysql:mysql /var/log/mysql

# Copy the script to create the database
COPY ./tools/init_db.sql /docker-entrypoint-initdb.d/
COPY ./tools/start.sh /docker-entrypoint-initdb.d/

EXPOSE 3306

# Run the entrypoint script
#CMD ["sh", "/docker-entrypoint-initdb.d/start.sh"]
