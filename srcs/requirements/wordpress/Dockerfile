FROM debian:bookworm

RUN apt update -y && apt upgrade -y

RUN apt install php8.2 php8.2-fpm php8.2-mysql -y && apt install curl -y

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

COPY ./tools/setup.sh /setup.sh

ENTRYPOINT ["sh", "setup.sh"]

CMD ["php-fpm8.2", "-R", "-F"]