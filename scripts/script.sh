#!/bin/sh
cat /root/header.txt >/root/body.txt
php /root/usuarios.php >>/root/body.txt
/usr/local/sbin/ssmtp -t < /root/body.txt
