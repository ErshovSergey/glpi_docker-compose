# Plugin для glpi

[Bays Management на github](https://github.com/InfotelGLPI/racks)

## Bays Management для ветки 9.2
[Release notes для версии GLPI 9.2 : Version 1.8.0](https://github.com/InfotelGLPI/racks/releases/tag/1.8.0)  
### Порядок установки  
`wget https://github.com/InfotelGLPI/racks/releases/download/1.8.0/glpi-racks-1.8.0.tar.gz`  
`tar -xzvf glpi-racks-1.8.0.tar.gz`  
`mv racks /<Путь до папки glpi>/html/glpi/plugins/`  
`chown -R www-data:www-data /<Путь до папки glpi>/html/glpi/plugins/racks`  
`rm glpi-racks-1.8.0.tar.gz`  

Далее **Setup\Plugin** необходимо инсталировать (**Install**) и активировать(**Enable**) плагин.



