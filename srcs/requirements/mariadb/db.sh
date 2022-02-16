service mysql start
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" | mysql -u root
echo "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
service mysql stop
mysqld_safe
