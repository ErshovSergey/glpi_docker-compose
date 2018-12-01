# Проект для запуска GLPI в контейнерах docker

## Устанавливаем и запускаем GLPI instance в docker.
Всего 4 контейнера:  
- для запуска glpi  
- контейнер [mysql:5.7](https://github.com/mysql/mysql-server)
- контейнер для клиента резервного копирования bareos-fd (опционально)
- контейнер с letsencrypt ([linuxserver/letsencrypt](https://github.com/linuxserver/docker-letsencrypt) ) (опционально)
```
# docker ps -a  
CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS                     PORTS                      NAMES  
1b8997776942        glpihostname_glpi    "/opt/entrypoint.sh"     6 minutes ago       Up 6 minutes               192.168.XXX.Х:80->80/tcp   glpi.hostname.ru_glpi  
f3eb793bfbc6        mysql:5.7            "docker-entrypoint.s…"   6 minutes ago       Up 6 minutes               3306/tcp, 33060/tcp        glpi.hostname.ru_mysql  
6e499f87605c        busybox              "sh"                     6 minutes ago       Exited (0) 6 minutes ago                              glpi.hostname.ru_glpi-data  
2a69a6982e6d        busybox              "sh"                     6 minutes ago       Exited (0) 6 minutes ago                              glpi.hostname.ru_mysql-data  
```

Размеры образов
``` 
# docker images  
REPOSITORY           TAG                 IMAGE ID            CREATED              SIZE  
glpihostname_glpi   latest              b87c1c8ff082        About a minute ago   372MB  
mysql                5.7                 702fb0b7837f        2 weeks ago          372MB  
linuxserver/letsencrypt   latest              d52b20f5a544        4 days ago          239MB
mysql                     5.7                 702fb0b7837f        2 weeks ago         372MB
debian                    stretch             be2868bebaba        4 weeks ago         101MB
debian                    jessie              efdec82af25a        4 weeks ago         127MB
busybox                   latest              59788edf1f3e        6 weeks ago         1.15MB
```  


### Клонируем проект
```shell
git clone https://github.com/ErshovSergey/glpi_docker-compose.git
```

### Хранение данных
Структура папки
```shell
glpi
   \msmtprc         настройки msmtp для отправки почты, не используется
   \html\           файлы glpi - файлы дистрибутива
   \mysql_data\     файлы MySQL - файлы БД
   \client_bareos   файлы настроек клиента bareos 
```

### 2. Измените настройки
В файле .env укажите необходимые данные.  
Если файла нет то необходимо скопировать .env-default в .env  
Параметры mysql сервера укажите в файле mysql.env.  
Если файла нет то необходимо скопировать mysql.env-default в mysql.env  


### Команды
Посмотреть параметры docker-compose
```shell
docker-compose config
```
Собрать и запустить compomose
```shell
docker-compose up -d --remove-orphans
```
Остановить
```shell
docker-compose down -v
```
Остановить и удалить все контейнеры и образы
```shell
docker-compose down -v --rmi all --remove-orphans
```
Посмотреть состояние  
```shell
docker-compose ps
```
Только glpi
```shell
docker-compose -f docker-compose.yml up -d
```
glpi и bareos-fd
```shell
docker-compose -f docker-compose.yml -f docker-compose.bareos.yml up -d
```
glpi, bareos-fd и letsencrypt+nginx-proxy
используется образ https://hub.docker.com/r/smashwilson/lets-nginx/
```shell
docker-compose \
	-f docker-compose.yml -f docker-compose.bareos.yml \
	-f docker-compose.linuxserver-letsencrypt.yml up \
	--build -d --remove-orphans --force-recreate
```

При использовании basic авторизации добавлять пароли командой
```
docker exec -it glpi.itsmpro.ru_letsencrypt htpasswd -c /config/nginx/.htpasswd <UserName>
```

Логи работы glpi  
В файлах 
```
/var/www/html/glpi/files/_log/php-errors.log
/var/www/html/glpi/files/_log/mail.log
/var/www/html/glpi/files/_log/mail-error.log
```

### [Настройка reverse-proxy](./doc/Настройка_reverse-proxy.md)
### [Настройка fail2ban](./doc/fail2ban.md)

### Дальнейшая настройка производится через браузер.
Настройка доступа mysql 
![Settings glpi-mysql](./glpi-mysql_settings.png)  
Для подключения к sql серверу указать **mysql**, **glpi** и пароль из **mysql.env**.

### [Интеграция с Active Directory](./doc/GLPI_ActiveDirectory_Authentication_Setting.md)

### Экспорт в PDF с использование кирилицы
Настраивается в **Setup\General\Default values**  
в поле **PDF export font** указать шрифт DejaVuSans.  
Сохранить и перелогинится.  

Расширить функционал можно с помощью плагинов.  
[fusioninventory-for-glpi](./doc/plugins_fusioninventory-for-glpi.md) - агент инвентаризации  
[Картографий positions](./doc/plugins_positions.md) - привязка Активов к положению на схеме  
[Network Architecture - archires](./doc/plugins_NetworkArchitecture-archires.md) - Сетевые архитектуры  
[Комплектовка - racks](./doc/plugins_BaysManagement.md) - управоение содержимым стоек
#### [Обновление plugins](doc/Update_plugins.md)
 


## Восстанавить базу mysql можно командой
```
cat /var/www/html/glpi.erchov.ru_sql | mysql -h mysql -u root -p
```

### [Обновление glpi](doc/Update_glpi.md)
