NAME = inception

DOCKER_COMPOSE = docker-compose -p $(NAME) -f srcs/docker-compose.yml

all: mkdir up

mkdir:
	@echo "Preparing directories..."
	@mkdir -p /home/msodor/data/wordpress
	@mkdir -p /home/msodor/data/mariadb

up:
	@echo "Running containers..."
	@$(DOCKER_COMPOSE) up -d --build

clean:
	@echo "Removing containers..."
	@$(DOCKER_COMPOSE) down

fclean: clean
	@echo "Cleaning all..."
	@docker system prune -af
	@sudo rm -rf /home/msodor/data

re: fclean all

.PHONY: all mkdir up clean fclean re
