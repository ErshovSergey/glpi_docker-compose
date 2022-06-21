### Обновление plugins
Все действия в контейнере с glpi.  
```
docker exec -i -t <container name>_glpi bash
```
После окончания **Setup\Plugin** необходимо обновить/инсталировать (**Upgrade/Install**) и активировать(**Enable**) по необходимости.

#### Appliances
[оф.сайт](https://forge.glpi-project.org/projects/appliances/files) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
#wget https://forge.glpi-project.org/attachments/download/2285/glpi-appliances-2.5.0.tar.gz
wget https://forge.glpi-project.org/attachments/download/2320/glpi-appliances-3.1.0.tar.gz
tar -xzf *.tar.gz
cp -r appliances /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### Behaviours
[оф.сайт](https://forge.glpi-project.org/projects/behaviors/files) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
#wget https://forge.glpi-project.org/attachments/download/2316/glpi-behaviors-2.4.1.tar.gz
wget https://forge.glpi-project.org/attachments/download/2336/glpi-behaviors-2.5.0.tar.gz
tar -xzf *.tar.gz
cp -r behaviors /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### procedimientos
[оф.сайт](https://github.com/calidadcarm/procedimientos) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/calidadcarm/procedimientos/archive/refs/tags/procedimientos_4.2.0.tar.gz
tar -xzf *.tar.gz
cp -r behaviors /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```
#### Environment
[оф.сайт](https://github.com/InfotelGLPI/environment/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/calidadcarm/procedimientos/archive/refs/tags/procedimientos_4.2.0.tar.gz
tar -xzf *.tar.gz
mv procedimientos-procedimientos_4.2.0 /var/www/html/glpi/plugins/procedimientos
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

####  GLPI Renamer  
[оф.сайт](https://github.com/InfotelGLPI/environment/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/renamer/archive/refs/tags/0.85-1.0.tar.gz
tar -xzf *.tar.gz
mv cp -r environment /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### FusionInventory
[оф.сайт](https://github.com/fusioninventory/fusioninventory-for-glpi/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
#wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.5.0%2B1.0/fusioninventory-9.5.0+1.0.tar.bz2
wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.5%2B3.0/fusioninventory-9.5+3.0.tar.bz2
tar xjf *.tar.bz2
cp -r fusioninventory /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### accounts - Аккаунты
[оф.сайт](https://github.com/InfotelGLPI/accounts/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
#wget https://github.com/InfotelGLPI/accounts/releases/download/2.5.0/glpi-accounts.2.5.0.tar.gz
wget https://github.com/InfotelGLPI/accounts/releases/download/2.6.0/glpi-accounts-2.6.0.tar.gz
tar xzf *.tar.gz
cp -r accounts /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### archires
[оф.сайт](https://forge.glpi-project.org/projects/archires/files) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://forge.glpi-project.org/attachments/download/2297/glpi-archires-2.7.0.tar.gz
tar xzf *.tar.gz
cp -r archires /var/www/html/glpi/plugins/archires
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### Badges
[оф.сайт](https://github.com/InfotelGLPI/badges) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/badges/releases/download/2.5.0/glpi-badges-2.5.0.tar.gz
tar xzf *.tar.gz
cp -r badges /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```


#### positions
[оф.сайт](https://github.com/InfotelGLPI/positions/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/positions/releases/download/5.0.0/glpi-positions-5.0.0.tar.gz
tar xzf *.tar.gz
cp -r positions /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### Print to pdf - PDF
[оф.сайт](https://forge.glpi-project.org/projects/pdf/files) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://forge.glpi-project.org/attachments/download/2252/glpi-pdf-1.4.0.tar.gz
tar xzf *.tar.gz
cp -r pdf /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### Human Resources
[оф.сайт](https://github.com/InfotelGLPI/resources/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/resources/releases/download/2.5.1/glpi-resources-2.5.1.tar.gz
tar xzf *.tar.gz
cp -r resources /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### Additional Reports
[оф.сайт](https://forge.glpi-project.org/projects/reports/files)
```
mkdir /plugins_update && cd /plugins_update
#wget https://forge.glpi-project.org/attachments/download/2253/glpi-reports-1.12.0.tar.gz
wget https://forge.glpi-project.org/attachments/download/2317/glpi-plugin-reports-1.14.0.tar.gz
tar xzf *.tar.gz
cp -r reports /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### timelineticket
[оф.сайт](https://github.com/pluginsGLPI/timelineticket/releases)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/timelineticket/releases/download/9.4%2B1.0/glpi-timelineticket-9.4+1.0.tar.gz
tar xzf *.tar.gz
cp -r timelineticket /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### telegram bot
[оф.сайт](https://github.com/pluginsGLPI/telegrambot/releases)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/telegrambot/releases/download/2.0.0/glpi-telegrambot-2.0.0.tar.bz2
tar xjf *.tar.bz2
cp -r telegrambot /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
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
rm -rf /plugins_update && cd /
```

#### GLPI treeview  
[оф.сайт](https://github.com/pluginsGLPI/treeview/releases)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/treeview/releases/download/1.8.0/glpi-treeview-1.8.0.tar.bz2
tar xjf *.tar.bz2
mv treeview /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### connections  
[оф.сайт](https://github.com/pluginsGLPI/connections)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/connections/releases/download/9.3/glpi-connections.9.3.tar.gz
tar xzf *.tar.gz
mv connections /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### glpi-dataflows  
[оф.сайт](https://github.com/ericferon/glpi-dataflows)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/ericferon/glpi-dataflows/releases/download/v2.0.15/dataflows-v2.0.15.tar.gz
tar xzf *.tar.gz
mv dataflows /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### glpi-archisw  
[оф.сайт](https://github.com/ericferon/glpi-archisw)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/ericferon/glpi-archisw/releases/download/v2.2.5/archisw-v2.2.5.tar.gz
tar xzf *.tar.gz
mv archisw /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### domains 
[оф.сайт](https://github.com/InfotelGLPI/domains)
```
mkdir /plugins_update && cd /plugins_update
#wget https://github.com/InfotelGLPI/domains/releases/download/2.1.0/glpi-domains-2.1.0.tar.gz
wget https://github.com/InfotelGLPI/domains/releases/download/2.2.1/glpi-domains-2.2.1.tar.gz
tar xzf *.tar.gz
cp -r domains /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```
[Настройка уведомлений о сроках доменов](./AlertExpiredDomains.md)
 
#### databases  
[оф.сайт](https://github.com/InfotelGLPI/databases)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/databases/releases/download/2.2.1/glpi-databases-2.2.1.tar.gz
tar xzf *.tar.gz
mv databases /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### webapplications  
[оф.сайт](https://github.com/InfotelGLPI/webapplications)
```
mkdir /plugins_update && cd /plugins_update
#wget https://github.com/InfotelGLPI/webapplications/releases/download/2.6.0/glpi-webapplications-2.6.0.tar.gz
wget https://github.com/InfotelGLPI/webapplications/releases/download/3.0.0/glpi-webapplications-3.0.0.tar.gz
tar xzf *.tar.gz
cp -r webapplications /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### badges  
[оф.сайт](https://github.com/InfotelGLPI/badges)
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/badges/releases/download/2.4.1/glpi-badges-2.4.1.tar.gz
tar xzf *.tar.gz
mv badges /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

## Network Architecture  
[Release notes для версии 2.6.0](https://forge.glpi-project.org/news/385)-последняя для версии 9.3  
### Порядок установки  
```
mkdir /plugins_update && cd /plugins_update
wget https://forge.glpi-project.org/attachments/download/2297/glpi-archires-2.7.0.tar.gz
tar xzf *.tar.gz
cp -r archires /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
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

## formcreator - Формы запросов
[Оф.сайт](https://github.com/pluginsGLPI/formcreator)  
### Порядок установки  
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/formcreator/releases/download/v2.10.2/glpi-formcreator-2.10.2.tar.bz2
tar xjf *.tar.bz2
mv formcreator /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

## actualtime - учет времени
[Оф.сайт](https://github.com/ticgal/actualtime/releases)  
### Порядок установки  
```
mkdir /plugins_update && cd /plugins_update
#wget https://github.com/ticgal/actualtime/releases/download/1.2.0/actualtime-1.2.0.tar.tgz
#wget https://github.com/ticgal/actualtime/releases/download/1.4.0/glpi-actualtime-1.4.0.tar.tgz
wget https://github.com/ticgal/actualtime/releases/download/1.5.0/glpi-actualtime-1.5.0.tar.tgz
tar xvf *.tar.tgz
cp -rv actualtime /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

## impacts - связь между элементами  
[Оф.сайт](https://github.com/tomolimo/impacts)  
### Порядок установки  
```
mkdir /plugins_update && cd /plugins_update
#wget https://github.com/tomolimo/impacts/archive/1.3.7.zip
wget https://github.com/tomolimo/impacts/releases/download/2.0.3/impacts-2.0.3.zip
apt-get install unzip
unzip *.zip
cp -rv impacts /var/www/html/glpi/plugins/impacts
cp -rv impacts /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

## ldapcomputers - LDAP computers - плагин для GLPI
[Оф.сайт](https://github.com/akm77/ldapcomputers)  
### Порядок установки  
```
mkdir /plugins_update && cd /plugins_update
#wget https://github.com/akm77/ldapcomputers/archive/master.zip
#apt-get install unzip
#unzip master.zip
#mv ldapcomputers-master /var/www/html/glpi/plugins/
wget https://github.com/akm77/ldapcomputers/releases/download/0.4.1/glpi-ldapcomputers-0.4.1.tar.bz2
tar xjf *.tar.bz2
cp -rv ldapcomputers /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```


## protocolsmanager  - Protocols Manager  
[Оф.сайт](https://github.com/mateusznitka/protocolsmanager/releases)  
### Порядок установки  
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/mateusznitka/protocolsmanager/releases/download/v1.1.2/protocolsmanager.tar.gz
tar xzf protocolsmanager.tar.gz
mv protocolsmanager /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### ldapcomputers
[оф.сайт](https://github.com/akm77/ldapcomputers/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/akm77/ldapcomputers/releases/download/0.3/glpi-ldapcomputers-0.3.tar.bz2
tar xjf *.tar.bz2
cp -r ldapcomputers /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### advancedplanning  
[оф.сайт](https://github.com/pluginsGLPI/advancedplanning/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/pluginsGLPI/advancedplanning/releases/download/0.1/glpi-advancedplanning-0.1.tar.bz2
tar xjf *.tar.bz2
cp -r advancedplanning /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

Далее **Setup\Plugin** необходимо инсталировать (**Install**) и активировать(**Enable**) плагин.  
[Исправить ошибки(опечатки, запросы sql)](mistakes_plugins__NetworkArchitectures.md)  
 
#### glpi-karastock
[оф.сайт](https://github.com/karhel/glpi-karastock/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/karhel/glpi-karastock/archive/refs/tags/1.2.1.tar.gz
tar xzf *.tar.gz
cp -R glpi-karastock-* /var/www/html/glpi/plugins/karastock
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### positions
[оф.сайт](https://github.com/InfotelGLPI/positions/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/positions/releases/download/5.0.0/glpi-positions-5.0.0.tar.gz
tar xzf *.tar.gz
cp -R positions /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```


#### cmdb
[оф.сайт](https://github.com/InfotelGLPI/cmdb) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/cmdb/releases/download/2.2.1/glpi-cmdb-2.2.1.tar.gz
tar xzf *.tar.gz
cp -R positions /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### glpi-modifications
[оф.сайт](https://github.com/stdonato/glpi-modifications) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/stdonato/glpi-modifications/archive/refs/tags/2.0.2.tar.gz
tar xzf *.tar.gz
cp -R glpi-modifications-2.0.2 /var/www/html/glpi/plugins/mod
rm -rf /plugins_update && cd /
```

#### Archibp
[оф.сайт](https://github.com/ericferon/glpi-archibp/releases/tag/v1.0.1) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/ericferon/glpi-archibp/releases/download/v1.0.1/archibp-v1.0.1.tar.gz
tar xzf *.tar.gz
cp -R archibp /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### glpi-dataflows
[оф.сайт](https://github.com/ericferon/glpi-dataflows) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/cconard96/glpi-screenshot-plugin/archive/refs/tags/v1.1.4.tar.gz
tar xzf *.tar.gz
cp -R archibp /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### FusionInventory
[оф.сайт](https://github.com/fusioninventory/fusioninventory-for-glpi/releases) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/cconard96/glpi-screenshot-plugin/archive/refs/tags/v1.1.4.tar.gz
tar xzf *.tar.gz
cp -vR glpi-screenshot-plugin-1.1.4 /var/www/html/glpi/plugins/screenshot
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```

#### Timesheet for GLPI
[оф.сайт](https://github.com/99net/Timesheet) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/99net/Timesheet/archive/refs/tags/v1.0.2.tar.gz
tar xzf *.tar.gz
cp -vR Timesheet-1.0.2 /var/www/html/glpi/plugins/Timesheet
chown -R www-data:www-data /var/www/html/glpi/plugins/
cd / && rm -rf /plugins_update
```

#### tasklists for GLPI
[оф.сайт](https://github.com/InfotelGLPI/tasklists) с исходным кодом
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/InfotelGLPI/tasklists/releases/download/1.6.2/glpi-tasklists-1.6.2.tar.gz
tar xzf *.tar.gz
cp -vR tasklists /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
cd / && rm -rf /plugins_update
```

## protocolsmanager  - Archibp - manage the business processes  
[Оф.сайт](https://github.com/ericferon/glpi-archibp/releases/tag/v1.0.3)  
### Порядок установки  
```
mkdir /plugins_update && cd /plugins_update
wget https://github.com/ericferon/glpi-archibp/releases/download/v1.0.3/archibp-v1.0.3.tar.gz
tar xzf archibp-v*.tar.gz
cp -R archibp /var/www/html/glpi/plugins/
chown -R www-data:www-data /var/www/html/glpi/plugins/
rm -rf /plugins_update && cd /
```
