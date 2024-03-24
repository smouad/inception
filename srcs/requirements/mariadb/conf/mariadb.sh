#!bin/sh

if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
        cat << EOF > /tmp/tmp_dbs.sql
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PWD}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
        mariadbd --user=mysql --bootstrap < /tmp/tmp_dbs.sql
        rm -f /tmp/tmp_dbs.sql
fi

exec "$@"