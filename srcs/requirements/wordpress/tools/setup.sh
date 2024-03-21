#!bin/bash

mkdir -p /var/www/html/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/wordpress/
rm -rf /var/www/html/wordpress/*

chmod -R 775 /var/www/html/wordpress/
chown -R www-data:www-data /var/www/html/wordpress/

wp core download --allow-root

wp core config --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PWD} --dbhost=mariadb --allow-root

wp core install --url=${WP_URL} --title=DopamInception --admin_user=${WP_USER} --admin_password=${WP_PWD} --admin_email=${WP_EMAIL} --a

exec $@