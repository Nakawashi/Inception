#!/bin/sh

# Load environment variables from .env
set -a
[ -f /docker-entrypoint-initdb.d/.env ] && . /docker-entrypoint-initdb.d/.env
set +a

# Run the server in the background and wait for it to start up before creating the database
mariadb-install-db --datadir=/var/lib/mysql \
    --auth-root-authentication-method=normal

# Give permissions to the database for the user mysql
chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /run/mysqld

# Start the server
mysqld_safe --datadir=/var/lib/mysql &

# Wait until mariadb is ready to accept connections
while ! mysqladmin ping -h "localhost" --silent; do
    sleep 1
done

# Create database from .sql file
eval "echo \"$(cat /docker-entrypoint-initdb.d/init_db.sql)\"" | mariadb

# Run the server
exec mysqld_safe --datadir=/var/lib/mysql
