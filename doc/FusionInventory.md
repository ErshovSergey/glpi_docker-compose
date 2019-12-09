## FusionInventory - Установка на Debian  
По  [мотивам](http://fusioninventory.org/documentation/agent/installation/linux/deb.html)  
Устанавливаем зависимости  
```
apt-get -y install dmidecode hwdata ucf hdparm \
  perl libuniversal-require-perl libwww-perl libparse-edid-perl \
  libproc-daemon-perl libfile-which-perl libhttp-daemon-perl \
  libxml-treepp-perl libyaml-perl libnet-cups-perl libnet-ip-perl \
  libdigest-sha-perl libsocket-getaddrinfo-perl libtext-template-perl \
  libxml-xpath-perl
```
Для fusioninventory-agent-task-network  
```
apt-get -y install libnet-snmp-perl libcrypt-des-perl libnet-nbname-perl
```
Для SNMPv3   
```
apt-get -y install libdigest-hmac-perl
```
Для fusioninventory-agent-task-deploy   
```
apt-get -y install libfile-copy-recursive-perl libparallel-forkmanager-perl
```
Для  WakeOnLan  
```
apt-get -y install libwrite-net-perl
```

Из пакетов
 ```
wget https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.1/fusioninventory-agent_2.5.1-1_all.deb
 dpkg -i fusioninventory-agent_2.5.1-1_all.deb
wget https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.1/fusioninventory-agent-task-collect_2.5.1-1_all.deb
 dpkg -i fusioninventory-agent-task-collect_2.5.1-1_all.deb
wget https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.1/fusioninventory-agent-task-network_2.5.1-1_all.deb
 dpkg -i fusioninventory-agent-task-network_2.5.1-1_all.deb
wget https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.1/fusioninventory-agent-task-deploy_2.5.1-1_all.deb
 dpkg -i fusioninventory-agent-task-deploy_2.5.1-1_all.deb
wget https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.1/fusioninventory-agent-task-esx_2.5.1-1_all.deb
 dpkg -i fusioninventory-agent-task-esx_2.5.1-1_all.deb
```
Правим _/etc/fusioninventory/agent.cfg_:  
- сервер glpi, параметр   
```
server = http://glpi.example.ru/plugins/fusioninventory/
```
Остальные параметры по необходимости.  
Запуск агента:  
```
systemctl restart fusioninventory-agent
```
Перечитать conf файл:  
```
systemctl reload fusioninventory-agent
```
Стартовать незамедлительно:  
```
pkill -USR1 -f -P 1 fusioninventory-agent
```
