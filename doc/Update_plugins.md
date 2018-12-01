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
tar -xzf *.tar.gz
cp -r environment /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### FusionInventory
[оф.сайт](https://github.com/fusioninventory/fusioninventory-for-glpi/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.3%2B1.3/fusioninventory-9.3+1.3.tar.bz2
tar xjf *.tar.bz2
cp -r fusioninventory /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### accounts
[оф.сайт](https://github.com/InfotelGLPI/accounts/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/accounts/releases/download/2.4.2/glpi-accounts-2.4.2.tar.gz
tar xzf *.tar.gz
cp -r accounts /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### archires
[оф.сайт](https://forge.glpi-project.org/projects/archires/files) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://forge.glpi-project.org/attachments/download/2265/glpi-archires-2.6.0.tar.gz
tar xzf *.tar.gz
cp -r archires /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### archires
[оф.сайт](https://github.com/InfotelGLPI/positions/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/positions/releases/download/4.5.1/glpi-positions-4.5.1.tar.gz
tar xzf *.tar.gz
cp -r positions /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```
