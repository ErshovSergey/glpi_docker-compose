### Номер телефона как ссылка ☎ tel:  
У пользователя есть поля с номерами телефонов.  
Следующее изменение добавляет возможность нажать на ссылку и набрать номер телефона  

#### Правим исходный код  
файл *<glpi>/inc/user.class.php*  
##### строка  
```
      echo "<td><label for='textfield_phone$phonerand'>" .  __('Phone') . "</label></td><td>";
```
в  
```
      echo "<td><label for='textfield_mobile$mobilerand'>" . __('Mobile phone') . "</label>";
      $tel_number = preg_replace("/ |-|\+/", "", $this->fields["phone"]);
      echo "<a href=tel:\"${tel_number}\"> ☎...</a>";
      echo "</td><td>";
```

##### строка  
```
      echo "<td><label for='textfield_mobile$mobilerand'>" . __('Mobile phone') . "</label></td><td>";
```
в  
```
      echo "<td><label for='textfield_mobile$mobilerand'>" . __('Mobile phone') . "</label>";
      $tel_number = preg_replace("/ |-|\+/", "", $this->fields["mobile"]);
      echo "<a href=tel:\"${tel_number}\"> ☎...</a>";
      echo "</td><td>";
```

##### строка  
```
      echo "<td><label for='textfield_phone2$phone2rand'>" .  __('Phone 2') . "</label></td><td>";
```
в  
```
      echo "<td><label for='textfield_mobile$mobilerand'>" . __('Mobile phone') . "</label>";
      $tel_number = preg_replace("/ |-|\+/", "", $this->fields["phone2"]);
      echo "<a href=tel:\"${tel_number}\"> ☎...</a>";
      echo "</td><td>";
```

