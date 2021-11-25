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

#### Ссылка на агент FusionInventory
Для размещения ссылки на скачивание агента FusionInventory на главной странице необходимо создать папку _<Folder glpi>/html/glpi/FI-agent/_. В неё помещать дистрибутивы агента FusionInventory.  
Настроить ссылку _Настройки\Общий_, поместить в поле _Текст в поле входа (поддерживаются HTML-теги)_  
```
Get agent FusionInventory --> <a color: #FFC18B; target="_blank" href="FI-agent/" title="agent FusionInventory"><font color="#FF0000;">here</font></a>
```
[Инструкция по подготовке преднастроенного агента FusionInventory для Windows](FusionInventory-agent/Readme.md)  
[Установка агента FusionInventory на Debian](doc/FusionInventory.md)  

[Программы для доступа к удаленным рабочим столам](doc/AccessToRemotePC.md)  
[Уведомления о регулярных событиях](./doc/AlertExpiredDomains.md)
