## Basic access authentication
Авторизация по login/pass до авторизации в glpi

### Как это работает
В */config/nginx/.htpasswd* находится пары "логин/пароль", которые позволят авторизоваться.

### Команды
Добавить пароль 
```
docker exec -it <ContainerName_letsencrypt> htpasswd -c /config/nginx/.htpasswd <UserName>
```
Также можно ограничить доступ по ip адресам.
Файл с разрешениями */config/nginx/list_IP*
```
# office
allow 10.X.X.0/24;
# home
allow Y.YY.YYY.YYYY;
# klient
allow Z.ZZZ.ZZ.ZZZZ;
```

### Полезные ссылки
