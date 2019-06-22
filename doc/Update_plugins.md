### Обновление plugins
Все действия в контейнере с glpi.  
После окончания **Setup\Plugin** необходимо обновить/инсталировать (**Upgrade/Install**) и активировать(**Enable**) по необходимости.

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
wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.3%2B1.4/fusioninventory-9.3+1.4.tar.bz2
tar xjf *.tar.bz2
cp -r fusioninventory /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### accounts - Аккаунты
[оф.сайт](https://github.com/InfotelGLPI/accounts/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/accounts/releases/download/2.4.3/glpi-accounts.2.4.3.tar.gz
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

#### positions
[оф.сайт](https://github.com/InfotelGLPI/positions/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/positions/releases/download/4.5.2/glpi-positions.4.5.2.tar.gz
tar xzf *.tar.gz
cp -r positions /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### Print to pdf - PDF
[оф.сайт](https://forge.glpi-project.org/projects/pdf/files) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://forge.glpi-project.org/attachments/download/2252/glpi-pdf-1.4.0.tar.gz
tar xzf *.tar.gz
cp -r pdf /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### Human Resources
[оф.сайт](https://github.com/InfotelGLPI/resources/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/resources/releases/download/2.5.1/glpi-resources-2.5.1.tar.gz
tar xzf *.tar.gz
cp -r resources /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### Additional Reports
[оф.сайт](https://forge.glpi-project.org/projects/reports/files)
```
mkdir /plugins_update && cd /plugins_update
wget https://forge.glpi-project.org/attachments/download/2253/glpi-reports-1.12.0.tar.gz
tar xzf *.tar.gz
cp -r reports /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### timelineticket
[оф.сайт](https://github.com/pluginsGLPI/timelineticket/releases)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/timelineticket/releases/download/9.3%2B1.0/glpi-timelineticket-9.3+1.0.tar.gz
tar xzf *.tar.gz
cp -r timelineticket /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### telegram bot
[оф.сайт](https://github.com/pluginsGLPI/telegrambot/releases)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/telegrambot/releases/download/2.0.0/glpi-telegrambot-2.0.0.tar.bz2
tar xjf *.tar.bz2
cp -r telegrambot /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```
[Настройка](../doc/GLPI-TelegramBot.md)

#### room
[оф.сайт](https://github.com/pluginsGLPI/room)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/room/archive/3.1.2.tar.gz
tar xzf *.tar.gz
mv room-3.1.2 /var/www/html/glpi/plugins/room
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### GLPI treeview  
[оф.сайт](https://github.com/pluginsGLPI/treeview/releases)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/treeview/releases/download/1.8.0/glpi-treeview-1.8.0.tar.bz2
tar xjf *.tar.bz2
mv treeview /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### connections  
[оф.сайт](https://github.com/pluginsGLPI/connections)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/connections/releases/download/9.3/glpi-connections.9.3.tar.gz
tar xzf *.tar.gz
mv connections /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### glpi-dataflows  
[оф.сайт](https://github.com/ericferon/glpi-dataflows)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/ericferon/glpi-dataflows/releases/download/v2.0.15/dataflows-v2.0.15.tar.gz
tar xzf *.tar.gz
mv dataflows /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### archisw  
[оф.сайт](https://github.com/ericferon/glpi-archisw)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/ericferon/glpi-archisw/releases/download/v2.1.1/archisw-v2.1.1.tar.gz
tar xzf *.tar.gz
mv archisw /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### domains 
[оф.сайт](https://github.com/InfotelGLPI/domains)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/domains/releases/download/2.0.2/glpi-domains-2.0.2.tar.gz
tar xzf *.tar.gz
mv domains /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```
[Настройка уведомлений о сроках доменов](./AlertExpiredDomains.md)
 
#### databases  
[оф.сайт](https://github.com/InfotelGLPI/databases)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/databases/releases/download/2.1.1/glpi-databases-2.1.1.tar.gz
tar xzf *.tar.gz
mv databases /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### webapplications  
[оф.сайт](https://github.com/InfotelGLPI/webapplications)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/webapplications/releases/download/2.5.2/glpi-webapplications-2.5.2.tar.gz
tar xzf *.tar.gz
mv webapplications /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

#### badges  
[оф.сайт](https://github.com/InfotelGLPI/badges)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/badges/releases/download/2.4.1/glpi-badges-2.4.1.tar.gz
tar xzf *.tar.gz
mv badges /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update
```

## Network Architecture  
[Release notes для версии 2.6.0](https://forge.glpi-project.org/news/385)-последняя для версии 9.3  
### Порядок установки  
```
mkdir /plugins_update && cd /plugins_update
wget https://forge.glpi-project.org/attachments/download/2265/glpi-archires-2.6.0.tar.gz
tar xzf *.tar.gz
mv glpi-archires /var/www/html/glpi/plugins/archires
chown -R www-data:www-data /<Путь до папки glpi>/html/glpi/plugins/archires
rm -rf /plugins_update && cd /
```
Далее **Setup\Plugin** необходимо инсталировать (**Install**) и активировать(**Enable**) плагин.  
[Исправить ошибки(опечатки, запросы sql)](mistakes_plugins__NetworkArchitectures.md)  


## timelineticket - Сроки заявок
[Оф.сайт](https://github.com/pluginsGLPI/timelineticket)  
### Порядок установки  
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/timelineticket/releases/download/9.3%2B1.1/glpi-timelineticket-9.3+1.1.tar.gz
tar xzf *.tar.gz
mv timelineticket /var/www/html/glpi/plugins/timelineticket
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```
Далее **Setup\Plugin** необходимо инсталировать (**Install**) и активировать(**Enable**) плагин.  
[Исправить ошибки(опечатки, запросы sql)](mistakes_plugins__NetworkArchitectures.md)  
 
