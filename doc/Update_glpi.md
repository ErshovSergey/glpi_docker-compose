
### Обновление glpi
Останавливаем все контейнеры.  
```docker-compose stop```  
Делаем резервную копию каталога с данными.  
```tar -zcvf NameBackup.tar.gz %GLPI_PATH%```  
Запускаем контейнеры.  
```docker-compose start```  
В контейнере glpi  
```docker exec -ti <glpi-conteiner-name> bash```  
Создаём временный каталог  
```mkdir /glpi_update && cd /glpi_update```  

#### Исходный код новой версии  
На странице [github.com/glpi-project/glpi/releases](https://github.com/glpi-project/glpi/releases) выбираем нужный релиз и скачиваем его, например  
```wget https://github.com/glpi-project/glpi/releases/download/9.3.3/glpi-9.3.3.tgz```  
Разархивируем в рабочий каталог, восстанавливаем разрешения и удаляем релиз
```
tar -zxvf glpi-9.3.3.tgz -C /var/www/html/
chown -R www-data:www-data /var/www/html/
cd / && rm -rf /glpi_update
```
Открываем glpi, проверяем что всё работает, если необходимо обновляем БД.  
Не забываем удалить файл  
```rm /var/www/html/glpi/install/install.php```  
#### Миграция на InnoDB engine при необходимости  
В контейнере запускаем  
```cd /var/www/html/glpi/scripts/ && php innodb_migration.php```  
#### Обновление версии mysql
В контейнере mysql запустить, ввести пароль root для mysql  
```mysql_upgrade -uroot -p```  
#### Исправление "Access to timezone database (mysql) is not allowed."  
##### В контейнере mysql запустить, ввести пароль root для mysql  
```
docker exec -i -t mysql.container.name bash
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -p -u root mysql
...
mysql -p -u root
...
GRANT SELECT ON `mysql`.`time_zone_name` TO 'glpi'@'%';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'glpi'@'%';
Ctrl+D
...
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -p -u root mysql
```
Перезапустить mysql  
##### В контейнере glpi обновить таблицы в контейнер  
```cd /var/www/html/glpi/```  
при ошибке *1 tables not migrated to InnoDB engine.*  
```php bin/console glpi:migration:myisam_to_innodb```  
при ошибке *3 columns are not compatible with timezones usage.*  
```php bin/console glpi:migration:timestamps```  
