#!/bin/sh
#
#  Script %name:        install.sh%
#  %version:            1 %
#  Description:			Install all dependences for Captive Portal can manage DB and email
# =========================================================================================================
#  %created_by:         Diego Villegas-dvillegast3@gmail.com (itservices) %
#  %date_created:       Wed Feb  5 09:07:30 +05 2020%
# =========================================================================================================
# change log
# =========================================================================================================
# Mod.ID         Who                            When                                    Description
# =================================================================================================== ======
# 
#                                                                               
# =========================================================================================================

##########################################################################
#			  IN THIS SECTION INSTALL MYSQL AND PHP_sqli
#
#			
#
#
##########################################################################
setenv  IGNORE_OSVERSION yes
pkg add http://pkg.freebsd.org/FreeBSD:11:amd64/latest/All/mysql56-client-5.6.47.txz
pkg add http://pkg.freebsd.org/FreeBSD:11:amd64/latest/All/mysql56-server-5.6.47.txz
pkg add http://pkg.freebsd.org/FreeBSD:11:amd64/latest/All/gsed-4.7.txz
pkg install -y php72-mysqli

/usr/local/bin/mysql_install_db --user=mysql --basedir=/usr/local --datadir=/var/db/mysql

mv /usr/local/etc/rc.d/mysql-server /usr/local/etc/rc.d/mysql-server.sh
/usr/local/bin/gsed -i 's/mysql_enable="NO"/mysql_enable="YES"/g' /usr/local/etc/rc.d/mysql-server.sh
echo 'mysql_enable="YES"' >> /etc/rc.conf
/usr/local/etc/rc.d/mysql-server.sh start

/usr/local/bin/mysqladmin -u root password 'YOUR_PASSWORD'


echo '#\!/bin/sh' >/usr/local/bin/mysql_relaunch.sh
echo 'service /mysql-server.sh status > /dev/null'>>/usr/local/bin/mysql_relaunch.sh
echo 'if [ $? != 0 ]; then'>>/usr/local/bin/mysql_relaunch.sh
echo '        service mysql-server.sh start'>>/usr/local/bin/mysql_relaunch.sh
echo 'fi'>>/usr/local/bin/mysql_relaunch.sh
chmod +x /usr/local/bin/mysql_relaunch.sh

echo '*/5 * * * * /bin/sh  /usr/local/bin/mysql_relaunch.sh' >> /var/cron/tabs/root

#create DB User, DB and database on Mysql
#GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'passw0rd'
#CREATE DATABASE usuarios;
#use usuarios
#CREATE TABLE usuarios ( user_id MEDIUMINT NOT NULL AUTO_INCREMENT, name varchar(80) NOT NULL, email varchar(80) NOT NULL UNIQUE, celular varchar(13) NOT NULL, establecimiento varchar(80) NOT NULL, fecha DATE NOT NULL, PRIMARY KEY (user_id) )
# This Only a test
#INSERT INTO usuarios (`name` , `email` , `celular` , `establecimiento` , `fecha`) VALUES ("Diego Villegas", "dvillegast4@gmail.com", "0987121637", "pintado", "2020-02-2")



pkg add http://pkg.freebsd.org/FreeBSD:11:amd64/latest/All/ssmtp-2.64_3.txz

##########################################################################
#			  IN THIS SECTION INSTALL SSMTP FOR MAIL MANAGE
#
#			BEFORE FOLLOW PROCESS TO GET AUTHORIZATION PASSWORD
#
#
##########################################################################


echo 'root=notificaciones.itservices@gmail.com'>/usr/local/etc/ssmtp/ssmtp.conf
echo 'mailhub=smtp.gmail.com:465'>>/usr/local/etc/ssmtp/ssmtp.conf
echo 'rewriteDomain='>>/usr/local/etc/ssmtp/ssmtp.conf
echo 'hostname=_HOSTNAME_'>>/usr/local/etc/ssmtp/ssmtp.conf
echo 'AuthUser=notificaciones.itservices@gmail.com'>>/usr/local/etc/ssmtp/ssmtp.conf
echo 'AuthPass=sgqgznwryplihmkj'>>/usr/local/etc/ssmtp/ssmtp.conf
echo 'FromLineOverride=YES'>>/usr/local/etc/ssmtp/ssmtp.conf
echo 'UseTLS=YES'>>/usr/local/etc/ssmtp/ssmtp.conf


echo 'to: MAIL_TO_RECIVE@hotmail.com'>/root/header.txt
echo 'bcc: MAIL_TO_RECIVE@gmail.com'>>/root/header.txt
echo 'From: notificaciones itservices'>>/root/header.txt
echo 'Subject: Notificacion portal cautivo'>>/root/header.txt
echo 'MIME-Version: 1.0'>>/root/header.txt
echo 'Content-Type: text/html'>>/root/header.txt
echo ''>>/root/header.txt
echo '<\!DOCTYPE html>'>>/root/header.txt
echo '<html>'>>/root/header.txt
echo '<body>'>>/root/header.txt
echo '<b>Se presenta adjunto, informe semanal de usuarios registrados en Poral Cautivo </b>'>>/root/header.txt



##########################################################################
#				 DONT WORK THIS SECTION FOR "$" CHARACTER.
#echo '$sql = "select name, email, celular, establecimiento, fecha from usuarios where fecha >= ".'"'.$date_sem.'"';'>>/root/usuarios.php
#
#I SUGESS CREATE DIRECTLY FILE FROM GIT SOURCE
#
#https://github.com/dhvilleg/pfsense_portalCautive_emailMarketing/blob/master/email_sender/root/usuarios.php
##########################################################################


#echo '<?php'>/root/usuarios.php
#echo '$servername = "localhost";'>>/root/usuarios.php
#echo '$username = "admin";'>>/root/usuarios.php
#echo '$password = "passw0rd";'>>/root/usuarios.php
#echo '$dbname = "usuarios";'>>/root/usuarios.php
#echo '$date_time=date("Y-m-d");'>>/root/usuarios.php
#echo '$date_sem=date("Y-m-d",strtotime($date_time."- 7 days"));'>>/root/usuarios.php
#echo ''>>/root/usuarios.php
#echo '// Create connection'>>/root/usuarios.php
#echo '$conn = new mysqli($servername, $username, $password, $dbname);'>>/root/usuarios.php
#echo '// Check connection'>>/root/usuarios.php
#echo 'if ($conn->connect_error) {'>>/root/usuarios.php
#echo '    die("Connection failed: " . $conn->connect_error);'>>/root/usuarios.php
#echo '}'>>/root/usuarios.php
#echo '$sql = "select name, email, celular, establecimiento, fecha from usuarios where fecha >= ".'"'.$date_sem.'"';'>>/root/usuarios.php
#echo '$result = $conn->query($sql);'>>/root/usuarios.php
#echo 'echo "<table border = '1'> \n"; '>>/root/usuarios.php
#echo 'echo "<tr><td>Nombre</td><td>E-Mail</td><td>Celular</td><td>Establecimiento</td><td>Fecha</td></tr> \n";'>>/root/usuarios.php
#echo 'if ($result->num_rows > 0) {'>>/root/usuarios.php
#echo '    // output data of each row'>>/root/usuarios.php
#echo '    while($row = $result->fetch_assoc()) {'>>/root/usuarios.php
#echo '        echo "<tr><td>". $row["name"]. "</td><td>". $row["email"]. "</td><td>" . $row["celular"] . "</td><td>" . $row["establecimiento"] . "</td><td>" . $row["fecha"] . "</td></tr> \n";'>>/root/usuarios.php
#echo '    }'>>/root/usuarios.php
#echo '} else {'>>/root/usuarios.php
#echo '    echo "0 results";'>>/root/usuarios.php
#echo '}'>>/root/usuarios.php
#echo ''>>/root/usuarios.php
#echo '$conn->close();'>>/root/usuarios.php
#echo '?>'>>/root/usuarios.php
#echo ''>>/root/usuarios.php
#echo '</body>'>>/root/usuarios.php
#echo '</html>'>>/root/usuarios.php


##########################################################################
#			IN THIS SECTION CREATE SCRIPTS TO AUTOMATE EMAIL
#
#			  SCHEDULE YOUR REPORT ACCORDING TO YOUR NEEDS
#
#
##########################################################################

echo '#\!/bin/sh'>/root/script.sh
echo 'cat /root/header.txt >/root/body.txt'>> /root/script.sh
echo 'php /root/usuarios.php >>/root/body.txt'>> /root/script.sh
echo '/usr/local/sbin/ssmtp -t < /root/body.txt'>> /root/script.sh
chmod +x /root/script.sh
echo '49 9 * * 1 /bin/sh /root/script.sh' >> /var/cron/tabs/root

