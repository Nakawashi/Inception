## Colors ##

BLUE		= \033[0;34m
VIOLET		= \033[0;36m
GREEN		= \033[0;32m
RED			= \033[0;31m
YELLOW		= \033[0;33m
NONE		= \033[0m


## Files ##

DOCKER_COMPOSE_FILE	= ./srcs/docker-compose.yml

##-----------------------------------------------------------++

all: volumes

volumes:
	@echo "${YELLOW}Creating [mariadb] and [wordpress] volumes...${NONE}"
	sudo mkdir /home/lgenevey/data/mariadb
	sudo mkdir /home/lgenevey/data/wordpress

dcu: # starts the contaners in background. -f specifies the path which is not where we are as normally
	@echo "${GREEN}Starting containers...${NONE}"
	docker compose -f ${DOCKER_COMPOSE_FILE} up -d

dcb: # builds image [name for specific one]
	@echo "${BLUE}Building images...${NONE}"
	docker compose -f ${DOCKER_COMPOSE_FILE} build

dcd: # stops the containers
	@echo "${VIOLET}Stopping containers...${NONE}"
	docker compose -f ${DOCKER_COMPOSE_FILE} down

ps: # shows running containers
	docker ps

psa: # showd every containers
	docker ps -a

destroy: # deletes everything 
	@echo "${RED}Cleaning everything...${NONE}"
	docker system prune -a --volumes
	sudo rm -rf /home/lgenevey/data/mariadb
	sudo rm -rf /home/lgenevey/data/wordpress

eval: # command given by the subject
	@echo "${RED}Preparing evaluation with big command that anihilates everythig"${NONE}
	docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

.PHONY: dcu dcb dcd destroy


