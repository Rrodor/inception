service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'127.0.0.1' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
