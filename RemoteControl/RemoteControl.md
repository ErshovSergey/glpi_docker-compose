https://forum.glpi-project.org/viewtopic.php?id=2599

How to remotely administer a Windows client computer by using Configuration Manager https://docs.microsoft.com/en-us/configmgr/core/clients/manage/remote-control/remotely-administer-a-windows-client-computer

Running Configuration Manager 2012 Remote Control standalone https://ccmexec.com/2012/05/running-configuration-manager-2012-remote-control-standalone/

How to remotely administer a Windows client computer by using Configuration Manager https://github.com/MicrosoftDocs/SCCMdocs/blob/master/sccm/core/clients/manage/remote-control/remotely-administer-a-windows-client-computer.md

Windows Firewall Settings for Configuration Manager Clients https://docs.microsoft.com/en-us/previous-versions/system-center/configuration-manager-2007/bb694088(v=technet.10)?redirectedfrom=MSDN

Configuring Remote Control in SCCM 2012 http://woshub.com/configuring-remote-control-in-sccm-2012/

- Содержимое *SCCM Remote Control.7z* поместить в *c:\Program Files (x86)*.  
- Проверить правильность путей в reg файле, применить reg файл.  

Reg файл
```
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\sccm]
@="URL:SCCM Remote Control Protocol for GLPI"
"URL Protocol"=""

[HKEY_CLASSES_ROOT\sccm\DefaultIcon]
@="\"C:\\Program Files (x86)\\SCCM Remote Control\\CmRcViewer.exe\",0"

[HKEY_CLASSES_ROOT\sccm\shell]

[HKEY_CLASSES_ROOT\sccm\shell\open]

[HKEY_CLASSES_ROOT\sccm\shell\open\command]
@="C:\\Progra~2\\SCCMRE~1\\CmRcViewer.exe \"%1%"
```

- В glpi создать внешнюю ссылку
```
Наименование	        SCCM
Ссылка или имя файла  sccm://[IP]/	
Открыть в новом окне  Нет

```
- Назначить на объект Компьютер
