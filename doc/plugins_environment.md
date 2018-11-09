# Plugin для glpi

[environment на github.com](https://github.com/InfotelGLPI/environment)  

## environment для ветки 9.2
[Release для версии GLPI 9.2 : Version 2.1.0](https://github.com/InfotelGLPI/environment/releases/tag/2.1.0)  
### Порядок установки  
`wget https://github.com/InfotelGLPI/environment/releases/download/2.1.0/glpi-environment-2.1.0.tar.gz`  
` tar -xzvf glpi-environment-2.1.0.tar.gz`  
`mv environment /<Путь до папки glpi>/html/glpi/plugins/`  
`chown -R www-data:www-data /<Путь до папки glpi>/html/glpi/plugins/environment/`  
`rm glpi-environment-2.1.0.tar.gz`  

Далее **Setup\Plugin** необходимо инсталировать (**Install**) и активировать(**Enable**) плагин.



