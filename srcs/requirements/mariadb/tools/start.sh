#!/bin/sh

service mysql start

WP_DATABASE="wordpress_db"
MYSQL_USER="user"
MYSQL_PASSWORD="1234"
MYSQL_ROOT_PASS="1234"

mysql -e "CREATE DATABASE IF NOT EXISTS '$WP_DATABASE';"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON '$WP_DATABASE'.* TO '$MYSQL_USER'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASS';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p 1234 shutdown

exec "$@"
