### Исправление ошибок в плагине Network Architectures  
[Исходный код плагина](https://forge.glpi-project.org/projects/archires)  
Всё, что написано ниже - относится к версии [2.6.0](https://forge.glpi-project.org/news/385)  
#### Синтаксическая ошибка  
Необходимо внести следующие измнения в код *<glpi>/plugins/archires/inc/locationquery.class.php*  
было (строка 323)  
```
$query .= " AND `nv`.`networkports_id` = np`.`id`
```
стало  
```
$query .= " AND `nv`.`networkports_id` = `np`.`id`
```
#### sql-89 via sql-92  
При включенной отладке видны ошибки в sql запросах.  
Похоже в какой-то момент (видомо при переходе от версии mysql4 к mysql5) стали появлятся ошибки при выборе vlan - проявляется это в не формировании схемы.  
[Описание возникновения ошибки](https://petrenco.com/mysql.php?txt=52)  
Необходимо внести следующие измнения в код *<glpi>/plugins/archires/inc/networkequipmentquery.class.php*
было (строка 251)
```
                  $query = "SELECT `$itemtable`.`id` AS idc, $fieldsnp , `$itemtable`.`name`,
                                   `$itemtable`.`".getForeignKeyFieldForTable($dbu->getTableForItemType($val."Type"))."`
                                       AS `type`,
                                   `$itemtable`.`users_id`, `$itemtable`.`groups_id`,
                                   `$itemtable`.`contact`, `$itemtable`.`states_id`,
                                   `$itemtable`.`entities_id`,`$itemtable`.`locations_id`
                            FROM `$itemtable`,
                                 `glpi_ipnetworks` AS ipn,
                                 `glpi_networkports` np";

                  if ($this->fields["vlans_id"] > "0") {
                     $query .= ", `glpi_networkports_vlans` nv";
                  }
```
стало
```
                  $query = "SELECT `$itemtable`.`id` AS idc, $fieldsnp , `$itemtable`.`name`,
                                   `$itemtable`.`".getForeignKeyFieldForTable($dbu->getTableForItemType($val."Type"))."`
                                       AS `type`,
                                   `$itemtable`.`users_id`, `$itemtable`.`groups_id`,
                                   `$itemtable`.`contact`, `$itemtable`.`states_id`,
                                   `$itemtable`.`entities_id`,`$itemtable`.`locations_id`
                            FROM `$itemtable`";

                  if ($this->fields["vlans_id"] > "0") {
                     $query .= ", `glpi_networkports_vlans` nv";
                  }

                  $query .= ", `glpi_ipnetworks` AS ipn,
                                 `glpi_networkports` np";
```

