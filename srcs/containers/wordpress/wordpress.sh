sleep 30
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
#if [ -e /var/www/html/wp-config.php ]
#then
#	echo "Wordpress config file already exists"
#else
   wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
   chmod +x wp-cli.phar
   mv wp-cli.phar /usr/local/bin/wp
   cd /var/www/html/
   wp core download --allow-root
   echo "Configuring Wordpress parameters"
   wp config create --allow-root --path=/var/www/html/ --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --dbprefix=${DB_PREFIX}
   wp core install --allow-root --path=/var/www/html/ --url=${DB_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_MAIL}
   wp user create --allow-root ${WP_NEW_USER} ${WP_NEW_USE_MAIL} --user_pass=${WP_NEW_USE_PASSWORD}
#fi                              
 exec "$@"