#!/bin/bash

 # Update system
  sudo apt-get update -y

 ## Install APache
 sudo apt-get install apache2 -y


 # Install MySQL database server
 export DEBIAN_FRONTEND="noninteractive"
 echo "mysql-server-5.6 mysql-server/root_password password root" | sudo debconf-set-selections
 echo "mysql-server-5.6 mysql-server/root_password_again password root" | sudo debconf-set-selections

 sudo apt-get install mysql-server -y

 # Enabling Mod Rewrite
    #a2enmod rewrite
    #php5enmod mcrypt
  sudo apt-get install php-mbstring php-zip php-gd php-json php-curl -yq

   ## Install PHP
 sudo  apt-get install php libapache2-mod-php php-mysql php-common apache2 apache2-bin apache2-data apache2-utils dbconfig-common dbconfig-mysql default-mysql-client fontconfig-config fonts-dejavu-core icc-profiles-free javascript-common libapache2-mod-php7.4 libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libfontconfig1 libgd3 libjansson4 libjbig0 libjpeg-turbo8 libjpeg8 libjs-jquery libjs-openlayers libjs-sphinxdoc  libjs-underscore liblua5.2-0 libonig5 libtiff5 libwebp6 libxpm4 libzip5 mysql-client-8.0 mysql-client-core-8.0 mysql-common php  php-bz2 php-common php-curl php-gd php-google-recaptcha php-mbstring php-mysql php-phpmyadmin-motranslator php-phpmyadmin-shapefile  php-phpmyadmin-sql-parser php-phpseclib php-psr-cache php-psr-container php-psr-log php-symfony-cache php-symfony-cache-contracts php-symfony-expression-language php-symfony-service-contracts php-symfony-var-exporter php-tcpdf php-twig php-twig-extensions  php-xml php-zip php7.4 php7.4-bz2 php7.4-cli php7.4-common php7.4-curl php7.4-gd php7.4-json php7.4-mbstring php7.4-mysql  php7.4-opcache php7.4-readline php7.4-xml php7.4-zip  ssl-cert  -y

 ## Install PhpMyAdmin

 ## Configure PhpMyAdmin
  sudo apt-get update -y

  sudo  DEBIAN_FRONTEND=noninteractive  apt-get -yq install phpmyadmin
  #sudo  apt-get -yq install phpmyadmin


  #sudo cp /tmp/script/phpmyadmin/config.inc.php    /etc/phpmyadmin/config.inc.php

  sudo cp  /tmp/script/phpmyadmin.conf   /etc/dbconfig-common/phpmyadmin.conf

  sudo  dpkg-reconfigure --frontend=noninteractive phpmyadmin

  sudo cp -r /tmp/script/phpmyadmin/    /etc/phpmyadmin/
  #sudo echo "Include /etc/phpmyadmin/apache.conf"  >> /etc/apache2/apache2.conf
  sudo chown ubuntu:ubuntu /etc/apache2/apache2.conf
  echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf
  sudo chown root:root /etc/apache2/apache2.conf

  #sed '226 a 'Include /etc/phpmyadmin/apache.conf''  /etc/apache2/apache2.conf

 # Set Permissions
  sudo chown -R www-data:www-data /var/www

 #enable the mbstring PHP extension for Apache and PHP to work with phpMyAdmin
  sudo phpenmod mbstring

 # Restart Apache
  sudo service apache2 restart
