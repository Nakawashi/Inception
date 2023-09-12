FROM debian:buster

MAINTAINER nakawashi

RUN apt update && apt upgrade -y && apt install -y \
    wget \
    lsb-release \
    apt-transport-https \
    mariadb-client \
    ca-certificates

# Ajout du dépôt PHP et installation de PHP 8.2
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
    apt update && apt install -y php8.2 php8.2-mysql php8.2-fpm && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./conf/php.conf /etc/php/8.2/fpm/pool.d/

COPY ./tools/wp_install.sh /

RUN bash wp_install.sh

RUN mkdir /run/php

EXPOSE 9000

#ENTRYPOINT ["bash", "wp_install.sh"]

CMD ["php-fpm8.2", "-F", "-R"]
