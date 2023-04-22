#!/bin/bash

PURP='\033[0;35m'
GRE='\033[0;32m'
WHI='\033[0;37m'
NC='\033[0m'

echo " "
echo " "
echo -e "${PURP}===== Updating System Repository and Installing Necessary Packages =====${NC}"
echo " "
echo " "
sleep 2

sudo apt update
sudo apt install -y apache2 mariadb-server mariadb-client php php-mysqli php-gd libapache2-mod-php

echo " "
echo " "
echo -e "${PURP}===== Downloading DVWA Packages===== ${NC}"
echo " "
echo " "
sleep 2

cd /tmp
wget https://github.com/ethicalhack3r/DVWA/archive/master.zip
unzip master.zip

echo " "
echo -e "${PURP}===== Configuing  DVWA =====${NC}"
echo " "
sleep .5
echo "sudo rm -rf /var/www/html"
sleep .2
echo "sudo mv DVWA-master /var/www/html"
sleep .2
echo "sudo chown www-data /var/www/html/hackable/uploads"
sleep .2
echo "sudo chown www-data /var/www/html/config"
sleep .2
echo "sudo cp /var/www/html/config/config.inc.php.dist /var/www/html/config/config.inc.php"

sudo rm -rf /var/www/html
sudo mv DVWA-master /var/www/html
sudo chown www-data /var/www/html/hackable/uploads
sudo chown www-data /var/www/html/config
sudo cp /var/www/html/config/config.inc.php.dist /var/www/html/config/config.inc.php

echo " "
echo " "
echo -e "${PURP}===== Setting up DVWA database =====${NC}"
echo " "
echo " "
sleep .5

sudo mysql -u root -e "create database dvwa;"
sudo mysql -u root -e "create user dvwa@localhost identified by 'p@ssw0rd';"
sudo mysql -u root -e "grant all on dvwa.* to dvwa@localhost;"
sudo mysql -u root -e "flush privileges;"


echo " "
echo " "
echo -e "${PURP}===== Configuring DVWA Settings =====${NC}"
echo " "
echo " "
sleep .5

sudo sed -i "s/^\$db_password.*/\$db_password = 'p@ssw0rd';/" /var/www/html/config/config.inc.php

echo " "
echo " "
echo -e "${PURP}===== Modifying PHP Configurations =====${NC}"
echo " "
echo " "
sleep .5
sudo sed -i "s/^allow_url_include.*/allow_url_include = On/" /etc/php/8.2/apache2/php.ini
sudo sed -i "s/^upload_max_filesize.*/upload_max_filesize = 10M/" /etc/php/8.2/apache2/php.ini

echo " "
echo " "
echo -e "${PURP}===== Restarting and Finalizing Installation =====${NC}"
echo " "
echo " "
sleep .5
sudo systemctl restart apache2
sudo systemctl restart mysql

echo " "
echo " "
echo " "
echo " "
echo -e "${GRE}DVWA Installation Complete! Access the Web App by Visiting:"
echo -e "${WHI}http://localhost"
echo " "
echo " "
echo " "
echo " "
