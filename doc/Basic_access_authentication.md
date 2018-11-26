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
В файл */config/nginx/list_IP* также можно добавить перенаправление на страницу с инсталятором агента, например так
```
# перенаправление на страницу для скачивания агента инвентаризации
  location ^~/FakeLocation/agent {
    auth_basic off;
    allow all;
    return 301   https://github.com/fusioninventory/fusioninventory-agent/releases;
  }
```
Теперь при запросе страницы *http://glpi.host.ru/agent* произойдет перенаправление на страницу с инсталяторм агента.

### Полезные ссылки
