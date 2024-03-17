#!/bin/sh

cat << EOF > /tmp/setup.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PWD}';
# GRANT ALL PRIVILEGES ON '${DB_NAME}'.* TO '${DB_USER}'@'%';
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWD}';
FLUSH PRIVILEGES;
EOF

mariadbd --user=mysql --bootstrap < /tmp/setup.sql
rm -f /tmp/setup.sql

exec $@