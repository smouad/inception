#!bin/bash

mkdir -p /var/www/html/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/wordpress/
rm -rf /var/www/html/wordpress/*

chmod -R 775 /var/www/html/wordpress/
chown -R www-data:www-data /var/www/html/wordpress/