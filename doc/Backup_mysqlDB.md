
### Backup mysql database
Для создания резервной копии можно использовать скритп

Запускать скрипт [mysql_backup.sh](./mysql_backup.sh) необходимо следующей командой
```
docker exec -ti <ИМЯ КОНТЕЙНЕРА MYSQL> /mysql_backup/mysql_backup.sh
```

Резервная копия будет создана в папке *${GLPI_PATH}/mysql_backup/* и иметь имя вида 
```
ИмяБазы_ТекущаяДата.gz
```
