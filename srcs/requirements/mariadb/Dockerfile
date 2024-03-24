FROM debian:bookworm

RUN apt update && apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./conf/mariadb.sh /mariadb.sh

ENTRYPOINT ["sh", "mariadb.sh"]

CMD ["mariadbd", "--user=root", "--bind-address=0.0.0.0"]
