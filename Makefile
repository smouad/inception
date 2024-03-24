NAME = inception

all: prepare
	@printf "Launch configuration ${NAME}...\n"
	@cd srcs && docker-compose up -d --build

prepare:
	@mkdir -p /home/msodor/data/wordpress
	@mkdir -p /home/msodor/data/mariadb

clean: down
	@printf "Cleaning configuration ${NAME}...\n"
	@cd srcs && docker-compose down
	@docker system prune -a
	@sudo rm -rf /home/msodor/data

fclean:
	@printf "Total clean ${NAME}... \n"
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa); fi
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf /home/msodor/data --force

re: fclean all

.PHONY: all prepare clean down re fclean