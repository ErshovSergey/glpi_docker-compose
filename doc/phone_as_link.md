### Номер телефона как ссылка ☎ tel:  
У пользователя есть поля с номерами телефонов.  
Следующее изменение добавляет возможность нажать на ссылку возле номера телефона и набрать номер телефона в телефонном приложении для пользователей
```
--- /home/glpi.itsmpro.ru/html/glpi/inc/user.class.php  2019-08-20 23:03:31.970798171 +0300
+++ /home/glpi.itsmpro.ru/html/glpi/inc/user.class.php.new      2019-08-20 23:05:04.257349184 +0300
@@ -2127,6 +2127,7 @@
       echo "<tr class='tab_bg_1'>";
       echo "<td><label for='textfield_phone$phonerand'>" .  __('Phone') . "</label></td><td>";
       Html::autocompletionTextField($this, "phone", ['rand' => $phonerand]);
+      echo "<a href='javascript: document.location.href = \"tel:\"+ document.getElementsByName(\"phone\")[0].value   ;'>  ☎...</a>";
       echo "</td>";
       //Authentications information : auth method used and server used
       //don't display is creation of a new user'
@@ -2161,6 +2162,7 @@
       echo "<tr class='tab_bg_1'>";
       echo "<td><label for='textfield_mobile$mobilerand'>" . __('Mobile phone') . "</label></td><td>";
       Html::autocompletionTextField($this, "mobile", ['rand' => $mobilerand]);
+      echo "<a href='javascript: document.location.href = \"tel:\"+ document.getElementsByName(\"mobile\")[0].value   ;'>  ☎...</a>";
       echo "</td>";
       $catrand = mt_rand();
       echo "<td><label for='dropdown_usercategories_id$catrand'>" . __('Category') . "</label></td><td>";
@@ -2171,6 +2173,7 @@
       echo "<tr class='tab_bg_1'>";
       echo "<td><label for='textfield_phone2$phone2rand'>" .  __('Phone 2') . "</label></td><td>";
       Html::autocompletionTextField($this, "phone2", ['rand' => $phone2rand]);
+      echo "<a href='javascript: document.location.href = \"tel:\"+document.getElementsByName(\"phone2\")[0].value   ;'>  ☎...</a>";
       echo "</td>";
       echo "<td rowspan='4' class='middle'><label for='comment'>" . __('Comments') . "</label></td>";
       echo "<td class='center middle' rowspan='4'>";
@@ -2180,6 +2183,7 @@
       $admnumrand = mt_rand();
       echo "<tr class='tab_bg_1'><td><label for='textfield_registration_number$admnumrand'>" . __('Administrative number') . "</label></td><td>";
       Html::autocompletionTextField($this, "registration_number", ['rand' => $admnumrand]);
+      echo "<a href='javascript: document.location.href = \"tel:\"+document.getElementsByName(\"registration_number\")[0].value   ;'>  ☎...</a>";
       echo "</td></tr>";

       $titlerand = mt_rand();

```

