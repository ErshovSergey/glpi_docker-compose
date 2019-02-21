#!/bin/bash

mysqldump -u${MYSQL_USER} -p${MYSQL_PASSWORD} --single-transaction --databases ${MYSQL_DATABASE} | gzip -9 -c > /mysql_backup/${MYSQL_DATABASE}_`date "+%Y-%m-%d"`.gz && echo   '  --->  Done.'

X=+30
# удаляем файлы резервных копий, кроме последних X-1
#rm -rf `ls -a mysql_backup/${MYSQL_DATABASE}_2* | sort -r | tail -n ${X}`
rm -rf `ls -a /mysql_backup/${MYSQL_DATABASE}_2* | sort -r | tail -n ${X}`

