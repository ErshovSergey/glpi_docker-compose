
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
