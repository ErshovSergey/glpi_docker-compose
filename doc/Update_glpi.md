
### Обновление glpi
Останавливаем все контейнеры.  
Делаем резервную копию каталога с данными.  
```
 tar -zcvf NameBackup.tar.gz %GLPI_PATH%
```
Запускаем контейнеры.  
В контейнере glpi  
```
docker exec -ti <glpi-conteiner-name> bash
```
Создаём временный каталог
```
mkdir glpi_update && cd glpi_update
```

#### Исходный код новой версии  
На странице [github.com/glpi-project/glpi/releases](https://github.com/glpi-project/glpi/releases) выбираем нужный релиз и скачиваем его, например  
```
wget https://github.com/glpi-project/glpi/releases/download/9.3.3/glpi-9.3.3.tgz
```
Разархивируем в рабочий каталог, восстанавливаем разрешения и удаляем релиз
```
tar -zxvf glpi-9.3.3.tgz -C /var/www/html/
chown -R www-data:www-data /var/www/html/
rm -rf ../glpi_update
```
Открываем glpi, проверяем что всё работает, если необходимо обновляем БД.
Не забываем удалить файл 
```
rm /var/www/html/glpi/install/install.php
```
#### Миграция на InnoDB engine при необходимости
В контейнере запускаем
```
cd /var/www/html/glpi/scripts/ && php innodb_migration.php
```

#### Обновление версии mysql
В контейнере mysql запустить, ввести пароль root для mysql
```
mysql_upgrade -uroot -p
```

#### Исправление "Access to timezone database (mysql) is not allowed."  

В контейнере mysql запустить, ввести пароль root для mysql
```
mysql -p -u root
...
GRANT SELECT ON `mysql`.`time_zone_name` TO 'glpi'@'127.0.0.1' IDENTIFIED BY 'PassForUserGLPI';
FLUSH PRIVILEGES;
Ctrl+D
...
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -p -u root mysql
```
Перезапустить mysql  
