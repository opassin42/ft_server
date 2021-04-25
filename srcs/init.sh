#! /bin/bash

#CREATE DIRECTORIES
mkdir -p /var/www/localhost/database
mv /nginx.conf /etc/nginx/sites-available/localhost
mv /wordpress.sql /var/www/localhost/database/

#GENERATE SSL CERTIFICATE
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=fr/ST=Paris/L=Paris/O=no/OU=no/CN=opassin/" \
	-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.pem

#LINK NGINX CONF
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#PHPMYADMIN
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz 
mv phpMyAdmin-5.0.4-all-languages /var/www/localhost/phpmyadmin
rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
mv /config.inc.php /var/www/localhost/phpmyadmin

#WORDPRESS
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/localhost/
rm -rf latest.tar.gz
mv /wp-config.php /var/www/localhost/wordpress/

#OWNER, RIGHTS
chown -R www-data:www-data /var/www/localhost
chmod 755 -R /var/www/localhost/*

#MYSQL
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql wordpress -u root --skip-password < /var/www/localhost/database/wordpress.sql


service mysql restart
service nginx start
service php7.3-fpm start
tail -f /dev/null
