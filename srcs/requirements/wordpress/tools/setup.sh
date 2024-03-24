#!/bin/sh

mkdir -p /var/www/html/wordpress

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_ROOT_PWD} --dbhost=${WP_DB_HOST}

wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}

wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PWD} --role=author

exec $@