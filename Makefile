# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vducoulo <vducoulo@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/25 19:31:49 by vducoulo          #+#    #+#              #
#    Updated: 2023/08/28 15:01:25 by vducoulo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

all:	$(NAME)

$(NAME):
	mkdir -p /home/vducoulo/data/mariadb 2>>/dev/null
	mkdir -p /home/vducoulo/data/wordpress 2>>/dev/null
	docker compose -v -f ./srcs/docker-compose.yml up --force-recreate --build -d 

down:
	docker compose -f ./srcs/docker-compose.yml down

up:
	docker compose -f ./srcs/docker-compose.yml up

build:
	mkdir -p /home/vducoulo/data/maria_db 2>>/dev/null
	mkdir -p /home/vducoulo/data/wordpress 2>>/dev/null
	docker compose -f ./srcs/docker-compose.yml build

cclean:	
	@-docker container rm -f nginx
	@-docker container rm -f wordpress
	@-docker container rm -f mariadb

iclean:
	@-docker rmi nginx
	@-docker rmi mariadb
	@-docker rmi wordpress

vclean:
	@-docker volume rm -f wordpress
	@-docker volume rm -f mariadb
	rm -rf /home/vducoulo/data/

fclean: cclean iclean vclean

prune:
	@-docker system prune -a --force

re: fclean all