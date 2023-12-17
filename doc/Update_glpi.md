
### Обновление glpi  
Останавливаем контейнеры.  
Делаем резервную копию каталога с данными.  
```cp -r <Folder> /tmp/```  
или из папки с данными  
```tar -zcvf NameBackup.tar.gz %GLPI_PATH%```  
Очищаем папку с glpi  
```rm -rf <Folder>/html/*```  
#### Исходный код новой версии  
На странице [github.com/glpi-project/glpi/releases](https://github.com/glpi-project/glpi/releases) выбираем нужный релиз   
Скачиваем новую версию  
```wget https://github.com/glpi-project/glpi/releases/download/10.0.10/glpi-10.0.10.tgz```  
Разархивируем  
```tar -zxf glpi-10.0.10.tgz -C <Folder>/html/```  
Восстановливаем папки из резервной копии  
config, files, marketplace и plugins  
```cp -R /tmp/<Folder>/html/glpi/config      <Folder>/html/glpi/```  
```cp -R /tmp/<Folder>/html/glpi/files       <Folder>/html/glpi/```  
```cp -R /tmp/<Folder>/html/glpi/marketplace <Folder>/html/glpi/```  
```cp -R /tmp/<Folder>/html/glpi/plugins     <Folder>/html/glpi/```  
Запускаем контейнеры.  
Из контейнера запускаем обновление  
```docker exec -i -t glpi10_glpi bash```  
    root@glpi:/# ```php /var/www/html/glpi/bin/console db:update```  
    root@glpi:/# ```php /var/www/html/glpi/bin/console db:check_schema_integrity```  
    root@glpi:/# ```chown -R www-data:www-data /var/www/html```  
Не забываем удалить файл  
    root@glpi:/# ```rm /var/www/html/glpi/install/install.php```  


```docker-compose start```  
В контейнере glpi  
```docker exec -ti <glpi-conteiner-name> bash```  
Создаём временный каталог  
```mkdir /glpi_update && cd /glpi_update```  

 
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
