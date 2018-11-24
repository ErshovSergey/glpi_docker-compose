## fail2ban
блокирование адреса при вводе неправльного пароля basic авторизации 5 раз.

Для работы необходимо указать в файле docker-compose.linuxserver-letsencrypt.yml строки
```
   cap_add:
     - NET_ADMIN
```
### Как это работает
fail@ban следить за файлом результата авторизации */config/log/nginx/error.log*.  

### Команды fail2ban 
Посмотреть блокированные ip
```
docker exec -ti ContainerName_letsencrypt fail2ban-client status nginx-http-auth
```
Разблокировать адрес
```
docker exec -ti ContainerName_letsencrypt fail2ban-client set nginx-http-auth unbanip a.b.c.d
```

### Полезные ссылки
[banning-with-http-auth-and-fail2ban](https://technicalramblings.com/blog/banning-with-http-auth-and-fail2ban/)  
[Using fail2ban](https://github.com/linuxserver/docker-letsencrypt#using-fail2ban)  
[Fail2ban](https://help.ubuntu.ru/wiki/fail2ban)  
