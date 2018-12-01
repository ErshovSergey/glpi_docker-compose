### Обновление plugins
Все действия в контейнере с glpi
После окончания файловых операций в glpi обновляем и включаем.

#### Appliances
[оф.сайт](https://forge.glpi-project.org/projects/appliances/files) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://forge.glpi-project.org/attachments/download/2259/glpi-appliances-2.4.1.tar.gz
tar -xzf glpi-appliances-2.4.1.tar.gz
cp -r appliances /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```


#### Behaviours
[оф.сайт](https://forge.glpi-project.org/projects/behaviors/files) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://forge.glpi-project.org/attachments/download/2251/glpi-behaviors-2.1.1.tar.gz
tar -xzf glpi-behaviors-2.1.1.tar.gz
cp -r behaviors /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### Environment
[оф.сайт](https://github.com/InfotelGLPI/environment/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/environment/releases/download/2.2.1/glpi-environment-2.2.1.tar.gz
tar -xzf glpi-behaviors-2.1.1.tar.gz
cp -r behaviors /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

