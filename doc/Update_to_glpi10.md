
На узле  
- остановить контейнеры glpi  
```docker-compose down```  

- очистить папку с исходниками glpi  
```rm -rf /home/DOCKER_DATA/glpihost.ru10/*```  
- скопировать папку  
```/usr/bin/rsync -azP /home/DOCKER_DATA/glpihost.ru/* /home/DOCKER_DATA/glpihost.ru10/```  
- переименовать  
```/home/DOCKER_BUILD/glpi_docker-compose ->/home/DOCKER_BUILD/glpi_docker-compose9.5```  
```/home/DOCKER_DATA/glpihost.ru -> /home/DOCKER_DATA/glpihost.ru9.5```  
- удаляем логи  
```rm -rf /home/DOCKER_DATA/glpihost.ru10/logs/apache2/*```  
- Скачиваем исходники  
```wget https://github.com/glpi-project/glpi/releases/download/10.0.12/glpi-10.0.12.tgz```  
- Удаляем текущую версию  
```rm -rf /home/DOCKER_DATA/glpihost.ru10/html/*```  
- Разархивируем  
```tar -zxf glpi-10.0.12.tgz -C /home/DOCKER_DATA/glpihost.ru10/html/```  
- Восстановливаем папки из резервной копии config, files, marketplace и plugins
```cp -R /home/DOCKER_DATA/glpihost.ru/html/glpi/config /home/DOCKER_DATA/glpihost.ru10/html/glpi/```  
```cp -R /home/DOCKER_DATA/glpihost.ru/html/glpi/marketplace /home/DOCKER_DATA/glpihost.ru10/html/glpi/```  
```cp -R /home/DOCKER_DATA/glpihost.ru/html/glpi/plugins /home/DOCKER_DATA/glpihost.ru10/html/glpi/```  
```cp -R /home/DOCKER_DATA/glpihost.ru/html/glpi/files /home/DOCKER_DATA/glpihost.ru10/html/glpi/```  
Директива PHP "session.cookie_httponly" должна быть установлена в значение "on", чтобы предотвратить доступ скрипта на стороне клиента к значениям cookie - добавлена строка в Dockerfile  
  && sed -i -e 's/^session.cookie_httponly.*/session.cookie_httponly = On/'  `find / -name php.ini` \  
- Запускаем контейнеры.  
```cd /home/DOCKER_BUILD/glpi_docker-compose10/```  
```docker-compose up --build -d --remove-orphans --force-recreate && docker-compose logs -f```  
- Добавить в  _/home/DOCKER_DATA/glpihost.ru10/html/glpi/.htaccess_  
```
# /var/www/glpi/.htaccess
RewriteBase /
RewriteEngine On
RewriteCond %{REQUEST_URI} !^/public
RewriteRule ^(.*)$ public/index.php [QSA,L]
```  
- Из контейнера запускаем обновление  
```docker exec -i -t glpihost.ru10_main bash```  
- Не забываем удалить файл  
```rm /var/www/html/glpi/install/install.php```  
- Обновляем базу данных  
```chown -R www-data:www-data /var/www/html```  
```cd /var/www/html/glpi/```  
```php bin/console db:update```  
```php bin/console db:check_schema_integrity```  
- Мигрируем данные  
```php bin/console glpi:migration:timestamps```  
```php bin/console migration:utf8mb4```  
```php bin/console migration:unsigned_keys```  
- Для исправления ошибок при обновлении снижаем требования mysql, а именно параметр sql_mode.  
-- Запоминаем текущее значение  
```SELECT @@sql_mode;```  
+-----------------------------------------------------------------------------------------------------------------------+
| @@sql_mode                                                                                                            |
+-----------------------------------------------------------------------------------------------------------------------+
| ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION |
+-----------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

- Установить значение  
```SET SQL_MODE='ALLOW_INVALID_DATES';```  
- Исправляем ошибки препятствующие обновлению:  
```use glpi;```  
```ALTER TABLE `glpi_items_devicebatteries` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;```  
```ALTER TABLE glpi_items_devicebatteries MODIFY devicebatteries_id DATE DEFAULT null;```  
```ALTER TABLE glpi_items_devicebatteries MODIFY entities_id DATE DEFAULT null;```  
```ALTER TABLE glpi_items_devicebatteries MODIFY items_id DATE DEFAULT null;```  
```ALTER TABLE glpi_items_devicebatteries MODIFY locations_id DATE DEFAULT null;```  
```ALTER TABLE glpi_items_devicebatteries MODIFY states_id DATE DEFAULT null;```  
```UPDATE glpi_items_devicebatteries SET items_id = NULL WHERE CAST(items_id AS CHAR(20)) = '0000-00-00';```  
```UPDATE glpi_items_devicebatteries SET devicebatteries_id = NULL WHERE CAST(devicebatteries_id AS CHAR(20)) = '0000-00-00';```  
```UPDATE glpi_items_devicebatteries SET locations_id = NULL WHERE CAST(locations_id AS CHAR(20)) = '0000-00-00';```  
```UPDATE glpi_items_devicebatteries SET states_id = NULL WHERE CAST(states_id AS CHAR(20)) = '0000-00-00';```  
```UPDATE glpi_items_devicebatteries SET entities_id = NULL WHERE CAST(entities_id AS CHAR(20)) = '0000-00-00';```  
```UPDATE glpi_items_devicebatteries SET manufacturing_date = NULL WHERE CAST(manufacturing_date AS CHAR(20)) = '1980-00-01';```  
- Возвращаем значение параметра SQL_MODE  
```SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';```  
- Проверить уведомление по почте.  


### Обновление glpi до версии 10
по [мотивам](https://glpi-install.readthedocs.io/en/latest/update.html).  
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
    root@glpi:/# ```php /var/www/html/glpi/bin/console db:check_schema_integrity```  
    root@glpi:/# ```php /var/www/html/glpi/bin/console db:update```  
    root@glpi:/# ```chown -R www-data:www-data /var/www/html```  
Не забываем удалить файл  
    root@glpi:/# ```rm /var/www/html/glpi/install/install.php```  
 
#### Fusioninventory в glpi10  
Работает без изменений, только надо изменить перенаправление  
```/glpi/plugins/fusioninventory/```   
в  
```/front/inventory.php```  
- если при обращении к ```/front/inventory.php```получаем ```Inventory is disabled```, то включить  
_/Домой/Администрирование/Оборудование/Включить инвентаризацию_  

### Отсутсвует настройка списка  
Добавить права на _Search result display(Показать результаты поиска)_ профилю пользователя.  
