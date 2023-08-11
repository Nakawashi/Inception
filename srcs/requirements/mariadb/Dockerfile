FROM alpine:3.18.3

RUN apk update && \
	apk add mariadb mariadb-client && \
	rm -rf /var/cache/apk/*

COPY ./conf/my-custom.cnf /etc/mysql/my.cnf

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN mkdir -p /var/lib/mysqld /run/mysqld

COPY ./tools/init_db.sql /tmp/init_db.sql
COPY ./conf/my-custom.cnf /etc/mysql/my.cnf

COPY ./tools/start.sh /docker-entrypoint-initdb.d/
EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--console"]
