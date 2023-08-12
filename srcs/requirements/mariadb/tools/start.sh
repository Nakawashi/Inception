#!/bin/sh

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DATABASE;"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
#mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');"
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('1234');"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p 1234 shutdown

exec "$@"
