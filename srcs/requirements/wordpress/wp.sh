sleep 10
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
if [ -e /var/www/html/wp-config.php ]
then
	touch /var/www/html/test.txt
else
   wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
   chmod +x wp-cli.phar
   mv wp-cli.phar /usr/local/bin/wp
   cd /var/www/html/
   wp core download --allow-root
   mv ./wp-config.php /var/www/html/
   echo "Configuring Wordpress parameters"
   wp config create --allow-root --path=/var/www/html/ --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --dbprefix=${DB_PREFIX} --skip-check
   wp core install --allow-root --path=/var/www/html/ --url=${DB_URL} --title="My Title" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_MAIL}
   wp user create --allow-root ${WP_NEW_USER} ${WP_NEW_USE_MAIL} --user_pass=${WP_NEW_USE_PASSWORD}
 fi                              
 exec "$@"

####################
#   Options       #
###################
#
#--url=<url>
#--title=<site-title>
#--admin_user=<username>
#[--admin_password=<password>]
#--admin_email=<email>
#[--skip-email]


#########################
#   GLOBAL PARAMETERS   #
#########################
#
#--path=<path>
#--url=<url>
#--ssh=[<scheme>:][<user>@]<host\|container>[:<port>][<path>]
#--http=<http>
#--user=<id\|login\|email>
#--skip-plugins[=<plugins>]
#--skip-themes[=<themes>]
#--skip-packages
#--require=<path>
#--exec=<php-code>
#--context=<context>
#--[no-]color
#--debug[=<group>]
#--prompt[=<assoc>]
#--quiet