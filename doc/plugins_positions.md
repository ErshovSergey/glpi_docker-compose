# Plugin для glpi

## positions для ветки 9.2
[Release notes для версии GLPI 9.2 : Version 4.4.0](https://github.com/InfotelGLPI/positions/releases/tag/4.4.0)  
### Порядок установки  
`wget https://github.com/InfotelGLPI/positions/releases/download/4.4.0/glpi-positions-4.4.0.tar.gz`  
`tar -xzvf glpi-positions-4.4.0.tar.gz`  
`mv positions /<Путь до папки glpi>/html/glpi/plugins/`  
`chown -R www-data:www-data /<Путь до папки glpi>/html/glpi/plugins/positions`  
`rm glpi-positions-4.4.0.tar.gz`  

Далее **Setup\Plugin** необходимо инсталировать (**Install**) и активировать(**Enable**) плагин.



