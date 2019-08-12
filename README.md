# Проект для запуска GLPI в контейнерах docker

## Устанавливаем и запускаем GLPI instance в docker.
Всего 4 контейнера:  
- для запуска glpi  
- контейнер [mysql:5.7](https://github.com/mysql/mysql-server)
- контейнер для клиента резервного копирования bareos-fd (опционально)
- контейнер с letsencrypt ([linuxserver/letsencrypt](https://github.com/linuxserver/docker-letsencrypt) ) (опционально)
```
# docker ps -a  
CONTAINER ID        IMAGE                     COMMAND                  CREATED             STATUS              PORTS                                                  NAMES
0dec04661132        linuxserver/letsencrypt   "/init"                  7 hours ago         Up 7 hours          192.168.123.2:80->80/tcp, 192.168.123.2:443->443/tcp   glpi.hostname.ru_letsencrypt
e9aba5ce194e        glpihostname_glpi        "/opt/entrypoint.sh"     7 hours ago         Up 7 hours          192.168.123.2:81->80/tcp                               glpi.hostname.ru_glpi
d20b743f2cad        mysql:5.7                 "docker-entrypoint.s…"   7 hours ago         Up 7 hours          3306/tcp, 33060/tcp                                    glpi.hostname.ru_mysql
```

Размеры образов
``` 
# docker images  
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
glpihostnameru_glpi       latest              8932da62690a        7 hours ago         376MB
debian                    stretch             4879790bd60d        2 weeks ago         101MB
<none>                    <none>              b6de9792859c        2 weeks ago         374MB
linuxserver/letsencrypt   latest              d52b20f5a544        3 weeks ago         239MB
mysql                     5.7                 702fb0b7837f        5 weeks ago         372MB
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
docker exec -it glpi.hostname.ru_letsencrypt htpasswd -c /config/nginx/.htpasswd <UserName>
```

#### Логи glpi  
В файлах 
```
${GLPI_PATH}/html/glpi/files/_log/*
```

#### Логи apache2
```
${GLPI_PATH}/logs/apache2/*
```

#### [Настройка reverse-proxy](./doc/Настройка_reverse-proxy.md)
#### [Настройка fail2ban](./doc/fail2ban.md)

#### Дальнейшая настройка производится через браузер.
Настройка доступа mysql  
![Settings glpi-mysql](./glpi-mysql_settings.png)  
Для подключения к sql серверу указать **mysql**, **glpi** и пароль из **mysql.env**.

#### Экспорт в PDF с использование кирилицы  
Настраивается в **Setup\General\Default values**  
в поле **PDF export font** указать шрифт DejaVuSans.  
Сохранить и перелогинится.  

Расширить функционал можно с помощью плагинов.  
[Комплектовка - racks](./doc/plugins_BaysManagement.md) - управление содержимым стоек  
 
#### Восстанавить базу mysql можно командой  
```
cat /var/www/html/glpi.hostame.ru_sql | mysql -h mysql -u root -p
```
#### [Обновление glpi](doc/Update_glpi.md)  
#### [Обновление plugins](doc/Update_plugins.md)  
#### [Интеграция с Active Directory](./doc/GLPI_ActiveDirectory_Authentication_Setting.md)  
#### [Отправка почты через gmail.com](doc/sent_mail_via_gmail.md)  
#### [TeamViewer ID как ссылка для запуска TeamViewer](doc/teamviewer-ID-as-link.md)  
#### [Номер телефона как ссылка tel:](doc/phone_as_link.md)  
