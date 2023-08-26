## Colors ##

BLUE		= \033[0;34m
VIOLET		= \033[0;36m
GREEN		= \033[0;32m
RED		= \033[0;31m
YELLOW		= \033[0;33m
NONE		= \033[0m


## Files ##

DOCKER_COMPOSE_FILE	= ./srcs/docker-compose.yml

## Image Names ##

NGINX		= "nginx"
MARIADB		= "mariadb"
WORDPRESS	= "wordpress"
##-----------------------------------------------------------++

all:

build : docker compose up

stop : docker compose down

destroy : docker system prune -a --volumes



.PHONY build stop destroy


