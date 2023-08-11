FROM alpine:3.18.3

# Expose network port
EXPOSE 3306

# Update packages and install MariaDB
RUN apk update && \
    apk add mariadb mariadb-client && \
    rm -rf /var/cache/apk/*

# Copy custom configuration file
COPY conf/50-server.cnf /etc/mysql/my.cnf

# Create necessary directories and set permissions
RUN mkdir -p /var/run/mysqld/ && \
    mkdir -p /run/mysqld/ && \
    chown -R mysql:root /run/mysqld

# Copy the script
COPY conf/script.sh /var/
RUN chmod 755 /var/script.sh

CMD ["sh", "/var/script.sh"]
