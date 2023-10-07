#!/bin/bash

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

sleep 5

echo	"CREATE DATABASE $MYSQLDB;" | mysql -u root -p$MYSQLROOTPWD

echo	"CREATE USER '$MYSQLUSER'@'%' IDENTIFIED BY '$MYSQLPASSWORD';" | mysql -u root -p$MYSQLROOTPWD

echo	"GRANT ALL PRIVILEGES ON $MYSQLDB.* TO '$MYSQLUSER'@'%';" | mysql -u root -p$MYSQLROOTPWD

echo	"ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQLROOTPWD';" | mysql -u root -p$MYSQLROOTPWD

echo	"FLUSH ALL PRIVILEGES;" | mysql -u root -p$MYSQLROOTPWD

kill	$(cat /var/run/mysqld/mysqld.pid)

mysqld



# mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQLROOTPWD;"
# mariadb -e "CREATE USER IF NOT EXISTS '$MYSQLUSER'@'%' IDENTIFIED BY '$MYSQLPASSWORD';"
# mariadb -e "GRANT ALL PRIVILEGES ON $MYSQLDB.* TO '$MYSQLUSER'@'%';"
# mariadb -e "FLUSH PRIVILEGES;"
# # mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY $MARIADB_ROOT_PASSWORD;"
# mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQLROOTPWD';"