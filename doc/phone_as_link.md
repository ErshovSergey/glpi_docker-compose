### Номер телефона как ссылка ☎ tel:  
У пользователя есть поля с номерами телефонов.  
Следующее изменение добавляет возможность нажать на ссылку и набрать номер телефона в телефонном приложении   

#### Правим исходный код  
файл *<glpi>/inc/user.class.php*   
      
##### строку ~ 2128  
```
      echo "<td><label for='textfield_phone$phonerand'>" .  __('Phone') . "</label></td><td>";
```
на  
```
      echo "<td><label for='textfield_phone$phonerand'>" . __('Phone') . "</label>";
      $tel_number = preg_replace("/ |-|\+/", "", $this->fields["phone"]);
      echo "<a href=tel:${tel_number}> ☎...</a>";
      echo "</td><td>";
```

##### строку ~ 2162  
```
      echo "<td><label for='textfield_mobile$mobilerand'>" . __('Mobile phone') . "</label></td><td>";
```
на  
```
      echo "<td><label for='textfield_mobile$mobilerand'>" . __('Mobile phone') . "</label>";
      $tel_number = preg_replace("/ |-|\+/", "", $this->fields["mobile"]);
      echo "<a href=tel:${tel_number}> ☎...</a>";
      echo "</td><td>";
```

##### строку ~ 2172  
```
      echo "<td><label for='textfield_phone2$phone2rand'>" .  __('Phone 2') . "</label></td><td>";
```
на  
```
      echo "<td><label for='textfield_phone2$phone2rand'>" . __('Phone 2') . "</label>";
      $tel_number = preg_replace("/ |-|\+/", "", $this->fields["phone2"]);
      echo "<a href=tel:${tel_number}> ☎...</a>";
      echo "</td><td>";
```

##### строку ~ 2181  
```
      echo "<tr class='tab_bg_1'><td><label for='textfield_registration_number$admnumrand'>" . __('Administrative number') . "</label></td><td>";
```
на  
```
      echo "<tr class='tab_bg_1'>";
      echo "<td><label for='textfield_registration_number$admnumrand'>" . __('Administrative number') . "</label>";
      $tel_number = preg_replace("/ |-|\+/", "", $this->fields["registration_number"]);
      echo "<a href=tel:${tel_number}> ☎...</a>";
      echo "</td><td>";
```

