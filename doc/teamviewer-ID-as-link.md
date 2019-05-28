### TeamViewer ID как ссылка для запуска TeamViewer  
Fusioninventory при инвентаризации собирает TeamViewer ID.  
Найти можно на странице ПК в разделе *Компьютер\Удаленное управление\Удаленное управление*  
#### Правим исходный код  
В файле *inc/computerremotemanagement.class.php*  функция *function showInformation($computers_id)* должна выглядеть так
```
         foreach ($a_remotemanagement as $remotemanagement) {
            echo "<tr class='tab_bg_1'>";
            echo "<td>".$remotemanagement['type']."</td>";
            if ($remotemanagement['type'] == "teamviewer") {
               // подключение через установленный teamviewer
               echo "<td><a href='teamviewer8://remotecontrol?connectcc=".$remotemanagement['number']."'>".$remotemanagement['number']." (install)"."</a></td>";
               // подключение через скачиваемую версию
               echo "<td><a target='_blank' href='https://start.teamviewer.com/".$remotemanagement['number']."'>".$remotemanagement['number']." (web)"."</a></td>";
            } else {
               echo "<td>".$remotemanagement['number']."</td>";
            }
            echo "<td colspan='2'>";
            echo "</tr>";
         }
```
[По мотивам](https://github.com/fusioninventory/fusioninventory-for-glpi/pull/2780/commits/7d70b73bbfd79da633360154648e2038f0e89ac7)    
