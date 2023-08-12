FROM alpine:3.18.3

# Update packages and install MariaDB
RUN apk update && \
    apk add mariadb mariadb-client && \
    rm -rf /var/cache/apk/*

# Copy the server configuration file
COPY ./conf/my-custom.cnf /etc/mysql/my.cnf

RUN mkdir -p /var/run/mysqld /run/mysqld && \
    chown -R mysql:root /run/mysqld

# Copy the script to create the database
COPY ./tools/init_db.sql /docker-entrypoint-initdb.d/
COPY ./tools/start.sh /docker-entrypoint-initdb.d/

EXPOSE 3306

# Run the entrypoint script
CMD ["sh", "/docker-entrypoint-initdb.d/start.sh"]
