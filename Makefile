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

## images
#	les lister, les builder
## containers
#	lancer les containers dans le bon ordre, les lister, les stopper
## volumes
#	les créer, les lister
#
#	lancer le script pour modifier les hosts
#	tout faire en sudo car pas besoin de reload la session

