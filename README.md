# Проект для запуска GLPI в контейнерах docker

## Устанавливаем и запускаем GLPI instance с docker.
### Клонируем проект
```shell
git clone https://github.com/ErshovSergey/glpi_docker-compose.git
```

### 1. Создайте папку для хранения файлов glpi.
Струкктура папки
```shell
glpi
   \msmtprc         настройки msmtp для отправки почты
   \html\           файлы glpi
   \mysql_data\     файлы MySQL
   \client_bareos   файлы клиента bareos 
```

### 2. Измените настройки
В файле .env укажите необходимые данные.  
Если файла нет то необходимо скопировать .env-default в .env  
Параметры mysql сервера укажите в файле mysql.env. Если файла нет то необходимо скопировать mysql.env-default в mysql.env  


### Команды
Посмотреть параметры docker-compose
```shell
docker-compose config
```
Собрать и запустить compomose
```shell
docker-compose up --build -d
```
Настройка доступа mysql 
![Settings glpi-mysql](./glpi-mysql_settings.png)  
Для подключения к sql серверу указать **mysql**, **glpi** и пароль из **mysql.env**.

Остановить и удалить  
```shell
docker-compose down
```
Посмотреть состояние  
```shell
docker-compose ps
```
Логи работы glpi  
В файлах 
```
/var/www/html/glpi/files/_log/php-errors.log
/var/www/html/glpi/files/_log/mail.log
/var/www/html/glpi/files/_log/mail-error.log
```

### [Интеграция с Active Directory](./doc/GLPI_ActiveDirectory_Authentication_Setting.md)

### Установка plugins
[fusioninventory-for-glpi](./doc/plugins_fusioninventory-for-glpi.md)  
[Картографий positions](./doc/plugins_positions.md)  
[Network Architecture - archires](./doc/plugins_NetworkArchitecture-archires.md)  



# Разобрать!!!
## timelineticket
 https://github.com/pluginsGLPI/timelineticket/releases
wget https://github.com/pluginsGLPI/timelineticket/releases/download/9.2%2B1.0/glpi-timelineticket-9.2.1.0.tar.gz
tar -xzvf glpi-timelineticket-9.2.1.0.tar.gz
mv timelineticket /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/glpi/plugins/

##  accounts
 https://github.com/InfotelGLPI/accounts
wget https://github.com/InfotelGLPI/accounts/releases/download/2.4.0/glpi-accounts-2.4.0.tar.gz
tar -xzvf glpi-accounts-2.3.2.tar.gz
mv accounts /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/glpi/plugins/

## environment
 https://github.com/InfotelGLPI/environment/
wget https://github.com/InfotelGLPI/environment/releases/download/2.2.0/glpi-environment-2.2.0.tar.gz
tar -xzvf glpi-environment-2.1.0.tar.gz
mv environment-master /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/glpi/plugins/
	
## appliances - нет для версии 9.3
 https://forge.glpi-project.org/projects/appliances
wget https://forge.glpi-project.org/attachments/download/2233/glpi-appliances-2.3.2.tar.gz
tar -xzvf glpi-appliances-2.3.2.tar.gz
mv appliances /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/glpi/plugins/



## Восстанавить базу mysql можно командой
cat /var/www/html/glpi.erchov.ru_sql | mysql -h mysql -u root -p





## Update glpi
http://glpi-install.readthedocs.io/en/latest/command-line.html
wget https://github.com/glpi-project/glpi/releases/download/9.3.0/glpi-9.3.tgz
tar zxvf glpi-9.3.tgz -C /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/
chown -R www-data:www-data /mnt/sdb/DOCKER_DATA/glpi_glpi.erchov.ru/html/


для обновления
wget https://github.com/fusioninventory/fusioninventory-for-glpi/archive/glpi9.2+2.0.tar.gz
mv /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/fusioninventory ./fusioninventory.old
tar -xzvf glpi9.2+2.0.tar.gz
mv fusioninventory-for-glpi-glpi9.2-2.0 /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/fusioninventory

##Plugins


wget https://forge.glpi-project.org/attachments/download/2231/glpi-pdf-1.3.1.1.tar.gz
tar -xzvf glpi-pdf-1.3.1.1.tar.gz
mv pdf /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins


wget https://github.com/pluginsGLPI/genericobject/archive/master.zip
wget https://github.com/pluginsGLPI/genericobject/archive/2.5.0.tar.gz
mv genericobject-2.5.0 /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/genericobject

wget https://github.com/flegastelois/behaviors/archive/master.zip
unzip master.zip
mv behaviors-master /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/behaviors

wget https://github.com/pluginsGLPI/fields/archive/master.zip
unzip master.zip
mv fields-master /mnt/sdb/DOCKER_DATA/glpi/html/glpi/plugins/fields



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


