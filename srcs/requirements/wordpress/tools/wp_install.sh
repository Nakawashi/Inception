#!/bin/bash

# Install WP-CLI
# apt-get update -y
apt-get install curl -y
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Move where Wordpress is gonna be installed, dl WP, remove tar.gz archive
cd /var/www/
wget http://fr.wordpress.org/latest-fr_FR.tar.gz
tar -xzvf latest-fr_FR.tar.gz
rm latest-fr_FR.tar.gz


# Télécharger WordPress si le fichier de configuration n'existe pas
if [ ! -f /var/www/wordpress/wp-config.php]; then
	# wp core download --allow-root
	
	# Créer le fichier de configuration WordPress
	wp config create \
		--allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'
	
	# Installer WordPress
	wp core install \
		--url=$DOMAIN_NAME \
		--title="$SITE_TITLE" \
		--admin_user=$ADMIN_USER \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL \
		--allow-root --path='/var/www/wordpress'
	
	# Créer un utilisateur
	wp user create \
		--allow-root \
		--role=author $USER1_LOGIN $USER1_MAIL \
		--user_pass=$USER1_PASSWORD \
		--path='/var/www/wordpress' >> /log.txt
fi


# Exécuter la commande passée en argument (peut être utilisée pour démarrer php-fpm ou autre)
exec "$@"
