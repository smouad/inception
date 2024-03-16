FROM debian:bookworm

RUN apt update -y && apt upgrade -y

RUN apt install php-fpm php-mysql -y && apt install curl -y

EXPOSE 9000

COPY ./tools/setup.sh /setup.sh