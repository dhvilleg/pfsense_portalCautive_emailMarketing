#!/usr/bin/env sh  

service /mysql-server.sh status > /dev/null
if [ $? != 0 ]; then
        service mysql-server.sh start
fi
