### Использование telegram для оповещения  
#### Настройка прокси сервера для обхода блокировки РКН  
Для обхода блокировок можно использовать прокси сервер.  
Для этого необходимо определить переменную окружения до запуска apache2, прокси сервер должен  быть https.  
```
export HTTPS_PROXY=1.2.3.4:55
```
#### Настройка plugin GLPI TelegramBot  
Согласно [видео](https://www.youtube.com/watch?v=TKqIpIaAIAE)    
[![Watch the video](http://img.youtube.com/vi/TKqIpIaAIAE/0.jpg)](https://www.youtube.com/watch?v=TKqIpIaAIAE)  

#### Подавление подписи в telegram  
При настройках по умолчанию в сообщениях telegram добавляется подпись вида  
```

-- 

Automatically generated by GLPI
```
что сильно добавляет в прокрутке к сообщениям telegram.  
Из интерфейса нет возможности убрать эту надпись  - это позиция авторов glpi.   
Но можно поправить исходный код, для этого в файле *root glpi/inc/notificationtemplate.class.php* код  
```
            $lang['content_text']
                  = (!empty($add_header)?$add_header."\n\n":'').                    Html::clean(self::process($template_datas['content_text'],
                                $data)."\n\n-- \n".$this->signature.
                                      "\n".Html::entity_decode_deep(__('Automatically generated by GLPI')))."\n\n".$add_footer;
```
довести до такого
```
            $lang['content_text']
                  = (!empty($add_header)?$add_header."\n\n":'').                    Html::clean(self::process($template_datas['content_text'],
                                $data));
```

[Шаблоны для оповещения через telegram для разных событий](https://github.com/ErshovSergey/glpi_docker-compose/blob/master/doc/TelegramMessageTemplate.md)  
