# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iqabbal <iqabbal@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/30 23:52:44 by iqabbal           #+#    #+#              #
#    Updated: 2023/10/05 21:06:11 by iqabbal          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#all		:
#			@ clear
#			@ mkdir -p /home/iqabbal/data
#			@ mkdir -p /home/iqabbal/data/v_wordpress
#			@ mkdir -p /home/iqabbal/data/v_mariadb

build   :		
			@ docker-compose -f ./srcs/docker-compose.yml up -d --build
down	:
			@ docker-compose -f ./srcs/docker-compose.yml down

#init    :  down   
#			@clear
#			@sudo rm -rf /home/iqabbal/data
#			@docker volume rm v_wordpress v_mariadb
#			@docker system prune -fa

