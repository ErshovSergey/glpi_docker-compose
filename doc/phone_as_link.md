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
      echo "<td><label for='textfield_phone$phonerand'>" .  __('Phone') . "</label>";
      echo "<a href=tel:";
      echo $this->fields["phone"];
      echo "> ☎...</a>";
      echo "</td><td>";
```

##### строка  
```
      echo "<td><label for='textfield_mobile$mobilerand'>" . __('Mobile phone') . "</label></td><td>";
```
в  
```
      echo "<td><label for='textfield_mobile$mobilerand'>" . __('Mobile phone') . "</label>";
      echo "<a href=tel:";
      echo $this->fields["mobile"];
      echo "> ☎...</a>";
      echo "</td><td>";
```

##### строка  
```
      echo "<td><label for='textfield_phone2$phone2rand'>" .  __('Phone 2') . "</label></td><td>";
```
в  
```
      echo "<td><label for='textfield_phone2$phone2rand'>" .  __('Phone 2') . "</label>";
      echo "<a href=tel:";
      echo $this->fields["phone2"];
      echo "> ☎...</a>";
```

