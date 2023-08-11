FROM alpine:3.18.3

# Update packages and install MariaDB
RUN apk update && \
    apk add mariadb mariadb-client && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /var/lib/mysqld /run/mysqld

# Copy the database configuration file
COPY ./tools/create_db.sql /tmp/create_db.sql

# Copy the server configuration file
COPY ./conf/my-custom.cnf /etc/my.cnf.d/

# Copy the script to create the database
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

# Run the entrypoint script
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
