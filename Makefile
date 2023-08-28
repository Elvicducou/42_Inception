# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vducoulo <vducoulo@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/25 19:31:49 by vducoulo          #+#    #+#              #
#    Updated: 2023/08/28 15:19:01 by vducoulo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

all:	$(NAME)

$(NAME):
	mkdir -p /home/vducoulo/data/maria_db 2>>/dev/null
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
	@-docker container rm -f inception_nginx
	@-docker container rm -f inception_wp
	@-docker container rm -f inception_mdb

iclean:
	@-docker rmi nginx
	@-docker rmi mariadb
	@-docker rmi wordpress

vclean:
	@-docker volume rm -f inception_wp_content_vol
	@-docker volume rm -f inception_mdb_db
	rm -rf /home/vducoulo/data/
	
fclean: cclean iclean vclean

prune:
	@-docker system prune -a --force

re: fclean all