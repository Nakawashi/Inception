FROM debian:buster

MAINTAINER nakawashi

RUN apt update && apt upgrade && apt install -y
RUN apt install wget -y
RUN apt-get install -y php7.3\
	php-fpm \
	php-mysql \
	mariadb-client && \
	rm -rf /var/lib/apt/lists/*

# download, unzip and give root's rights
RUN wget https://fr.wordpress.org/wordpress-6.3-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.3-fr_FR.tar.gz && rm wordpress-6.3-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

# install WP CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /auto_config.sh

ENTRYPOINT ["bash", "auto_config.sh"]
sdafasfasdf