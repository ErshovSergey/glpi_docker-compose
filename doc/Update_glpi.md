
### Обновление glpi
Останавливаем все контейнеры.  
Делаем резервную копию каталога с данными.  
Запускаем контейнры. Идем в контейнер с glpi  
```
docker exec -ti <dockername> bash
```
Создаём временный каталог
```
mkdir glpi_update && cd glpi_update
```

#### Исходный код
На странице github.com/glpi-project/glpi/releases выбираем нужный релиз и скачиваем его, например  
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
#### Миграция на InnoDB engine
В контейнере запускаем
```
cd /var/www/html/glpi/scripts/ && php innodb_migration.php
```
#### [Обновляем plugin's](doc/Update_plugins.md)
