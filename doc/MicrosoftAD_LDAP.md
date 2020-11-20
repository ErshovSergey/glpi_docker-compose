Строка для авторизации пользователей через LDAP из группы Microsoft AD
```
(&  (&(objectclass=person)(objectclass=user)(!(userAccountControl:1.2.840.113556.1.4.803:=2))(|(memberof=CN=ggroup-xxxxxxx-portal,DC=xxxx,DC=xxxx,DC=xxx)(primaryGroupID=5667))))
```
