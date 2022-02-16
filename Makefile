DOCS=srcs/docker-compose.yml

all: create_dir build up


create_dir:
		mkdir -p /home/${USER}/data/wordpress
		mkdir -p /home/${USER}/data/mariadb

build:
		docker-compose -f $(DOCS) build

up:
		docker-compose -f $(DOCS) up -d

stop:
		docker stop $$(docker ps -aq)
		docker rm $$(docker ps -aq)

fclean:
		docker stop $$(docker ps -aq)
		docker rm $$(docker ps -aq)
		docker rmi $$(docker images -aq) -f
		docker volume rm $$(docker volume ls -q)
		sudo rm -rf ../../data/mariadb ../../data/wordpress
		docker volume rm srcs_mariadb srcs_wordpress -f