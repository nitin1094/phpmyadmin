#!/bin/bash  

 #sudo -s  
 # Check if running as root  
 #if [ "$(id -u)" != "0" ]; then  
   #echo "This script must be run as root" 1>&2  
   #exit 1  
 #fi  
   
 # Ask value for mysql root password   
 #read -p 'db_root_password [secretpasswd]: ' db_root_password  
 #echo  
   
 # Update system  
 sudo apt-get update -y  
   
 ## Install APache  
 sudo apt-get install apache2 -y   
   
 ## Install PHP  
 apt-get install php libapache2-mod-php php-mysql -y  
   
 # Install MySQL database server  
 export DEBIAN_FRONTEND="noninteractive"  
 echo "mysql-server-5.6 mysql-server/root_password password root" | sudo debconf-set-selections
 echo "mysql-server-5.6 mysql-server/root_password_again password root" | sudo debconf-set-selections 
 
 #debconf-set-selections <<< "mysql-server mysql-server/root_password password redhat"  
 #debconf-set-selections <<< "mysql-server mysql-server/root_password_again password redhat"  
 apt-get install mysql-server -y  
   
 # Enabling Mod Rewrite  
   a2enmod rewrite  
   php5enmod mcrypt  
   
 ## Install PhpMyAdmin  
 #sudo apt-get install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y  
   
 ## Configure PhpMyAdmin  
 export DEBIAN_FRONTEND=noninteractive
 apt-get -yq install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y
 cp  /home/ubuntu/phpmyadmin/config.inc.php  /etc/phpmyadmin/config.inc.php
 cp  /home/ubuntu/phpmyadmin.conf /etc/dbconfig-common/phpmyadmin.conf
 dpkg-reconfigure --frontend=noninteractive phpmyadmin
 #echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf  
   
 # Set Permissions  
 chown -R www-data:www-data /var/www  

 #enable the mbstring PHP extension for Apache and PHP to work with phpMyAdmin
 phpenmod mbstring
   
 # Restart Apache  
 service apache2 restart  

 #Configuring Password Access for the MySQL Root Account
 #mysql
 
 #check which authentication method each of your MySQL user use
 #SELECT user,authentication_string,plugin,host FROM mysql.user;    
 
 #To configure the root account to authenticate with a password not with auth_socket plugin
 #ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'redhat';

 

