# Project to deploy GLPI with docker

Устанавливаем и запускаем GLPI instance с docker.

1. Создайте папку для хранения файлов glpi.
Струкктура папки
glpi
   \msmtprc      настройки msmtp для отправки почты
   \html\        файлы glpi
   \mysql_data\  файлы MySQL

В файле .env укажите необходимые данные. Если файла нет то необходимо скопировать .env-default в .env.
Параметры mysql сервера укажите в файле mysql.env. Если файла нет то необходимо скопировать mysql.env-default в mysql.env.

Параметры docker-compose
docker-compose config

Собрать и запустить compomose
docker-compose up --build -d

Остановить и удалить 
docker-compose down

Посмотреть состояние
docker-compose ps


Устанавливаем plugins
#Plugins

## fusioninventory-for-glpi 
# 
#wget https://github.com/fusioninventory/fusioninventory-for-glpi/archive/glpi9.3.zip
#unzip glpi9.3.zip
wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.2%2B2.1/fusioninventory-9.2+2.1.tar.bz2
tar xvjf fusioninventory-9.2+2.1.tar.bz2
mv fusioninventory-for-glpi-glpi9.3 /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/glpi/plugins/fusioninventory
chown -R www-data:www-data /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/glpi/plugins/*

## positions - Cartographies
# https://github.com/InfotelGLPI/positions/releases
wget https://github.com/InfotelGLPI/positions/releases/download/4.4.0/glpi-positions-4.4.0.tar.gz
###wget https://github.com/InfotelGLPI/positions/releases/download/4.5.0/glpi-positions-4.5.0.tar.gz
tar -xzf glpi-positions-4.5.0.tar.gz
mv positions /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/glpi/plugins/

## archires
# https://forge.glpi-project.org/projects/archires
wget https://forge.glpi-project.org/attachments/download/2235/glpi-archires-2.5.1.tar.gz
tar -xzvf glpi-archires-2.5.1.tar.gz
mv archires /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/glpi/plugins/

## timelineticket
# https://github.com/pluginsGLPI/timelineticket/releases
wget https://github.com/pluginsGLPI/timelineticket/releases/download/9.2%2B1.0/glpi-timelineticket-9.2.1.0.tar.gz
tar -xzvf glpi-timelineticket-9.2.1.0.tar.gz
mv timelineticket /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/glpi/plugins/











для обновления
wget https://github.com/fusioninventory/fusioninventory-for-glpi/archive/glpi9.2+2.0.tar.gz
mv /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/fusioninventory ./fusioninventory.old
tar -xzvf glpi9.2+2.0.tar.gz
mv fusioninventory-for-glpi-glpi9.2-2.0 /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/fusioninventory

##Plugins


wget https://forge.glpi-project.org/attachments/download/2231/glpi-pdf-1.3.1.1.tar.gz
tar -xzvf glpi-pdf-1.3.1.1.tar.gz
mv pdf /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins

wget https://github.com/InfotelGLPI/accounts/releases/download/2.3.1/glpi-accounts-2.3.1.tar.gz
tar -xzvf glpi-accounts-2.3.1.tar.gz
mv accounts /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins

wget https://github.com/pluginsGLPI/genericobject/archive/master.zip
wget https://github.com/pluginsGLPI/genericobject/archive/2.5.0.tar.gz
mv genericobject-2.5.0 /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/genericobject

wget https://github.com/flegastelois/behaviors/archive/master.zip
unzip master.zip
mv behaviors-master /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/behaviors

wget https://github.com/pluginsGLPI/fields/archive/master.zip
unzip master.zip
mv fields-master /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/fields

wget https://github.com/InfotelGLPI/environment/archive/master.zip
unzip master.zip
mv environment-master /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/environment

appliances
wget https://forge.glpi-project.org/attachments/download/2233/glpi-appliances-2.3.2.tar.gz
tar -xzvf glpi-appliances-2.3.2.tar.gz
mv appliances /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/appliances

Human Resources Management
wget https://github.com/InfotelGLPI/resources/releases/download/2.4.3/glpi-resources-2.4.3.tar.gz
tar -xzvf glpi-resources-2.4.3.tar.gz
mv resources /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/resources

## reports
https://forge.glpi-project.org/projects/reports/files
wget https://forge.glpi-project.org/attachments/download/2246/glpi-plugin-reports-1.11.3.tar.gz
tar -xzf glpi-plugin-reports-1.11.3.tar.gz
mv reports /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/
chown -R www-data:www-data /mnt/sdb/DOCKER_DATA/glpi/html/*


## Update
http://glpi-install.readthedocs.io/en/latest/command-line.html
wget https://github.com/glpi-project/glpi/releases/download/9.2.3/glpi-9.2.3.tgz
tar -xzf glpi-9.2.3.tgz -C /mnt/sdb/DOCKER_DATA/glpi/html/
chown -R www-data:www-data /mnt/sdb/DOCKER_DATA/glpi/html/*

