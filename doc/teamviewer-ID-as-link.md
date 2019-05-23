### TeamViewer ID как ссылка для запуска TeamViewer  
Fusioninventory при инвентаризации собирает TeamViewer ID.  
Найти можно на странице ПК в разделе *Компьютер\Удаленное управление\Удаленное управление*  
#### Правим исходный код  
Для файла *inc/computerremotemanagement.class.php*  
применяем патч 
```
-94,7 +94,11 @@ function showInformation($computers_id) {
         foreach ($a_remotemanagement as $remotemanagement) {
            echo "<tr class='tab_bg_1'>";
            echo "<td>".$remotemanagement['type']."</td>";
            echo "<td>".$remotemanagement['number']."</td>";
            if ($remotemanagement['type'] == "teamviewer") {
               echo "<td><a href='https://start.teamviewer.com/".$remotemanagement['number']."'>".$remotemanagement['number']."</a></td>";
            } else {
               echo "<td>".$remotemanagement['number']."</td>";
            }
            echo "<td colspan='2'>";
            echo "</tr>";
         }
```
[Источник](https://github.com/fusioninventory/fusioninventory-for-glpi/pull/2780/commits/7d70b73bbfd79da633360154648e2038f0e89ac7)    
