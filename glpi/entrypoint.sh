#!/bin/bash

FOLDER_GLPI=glpi/
FOLDER_WEB=/var/www/html/
#GLPI_VERSION=feik

#check if TLS_REQCERT is present
if !(grep -q "TLS_REQCERT" /etc/ldap/ldap.conf)
then
	echo "TLS_REQCERT isn't present"
        echo -e "TLS_REQCERT\tnever" >> /etc/ldap/ldap.conf
fi

# устанавливаем последний релиз если ещё не установлено
if [ "$(ls ${FOLDER_WEB}${FOLDER_GLPI})" ];
then
	echo "GLPI is already installed"
else
	mkdir -p "${FOLDER_WEB}${FOLDER_GLPI}"

	SRC_GLPI="https://github.com/glpi-project/glpi/releases/download/${GLPI_VERSION}/glpi-${GLPI_VERSION}.tgz"
	# если версия не указана - скачиваем последнюю
	[[ ! "$GLPI_VERSION" ]] \
		&& SRC_GLPI=$(curl -s https://api.github.com/repos/glpi-project/glpi/releases/latest | grep browser_download_url | cut -d '"' -f 4)

	TAR_GLPI=${FOLDER_WEB}glpi-targz.tgz
	wget -P ${FOLDER_WEB} ${SRC_GLPI} -O ${TAR_GLPI}
	tar -xzf ${TAR_GLPI} -C ${FOLDER_WEB}
	rm -Rf  ${TAR_GLPI}
	chown -R www-data:www-data ${FOLDER_WEB}${FOLDER_GLPI}
fi

#Modification du vhost par défaut
echo -e "<VirtualHost *:80>\n\tDocumentRoot /var/www/html/glpi\n\n\t<Directory /var/www/html/glpi>\n\t\tAllowOverride All\n\t\tOrder Allow,Deny\n\t\tAllow from all\n\t</Directory>\n\n\tErrorLog /var/log/apache2/error-glpi.log\n\tLogLevel warn\n\tCustomLog /var/log/apache2/access-glpi.log combined\n</VirtualHost>" > /etc/apache2/sites-available/000-default.conf

#Add scheduled task by cron
echo MAILTO=\"\" > /var/spool/cron/crontabs/www-data
echo "*/5 * * * * /usr/bin/php /var/www/html/glpi/front/cron.php > /dev/null" >> /var/spool/cron/crontabs/www-data
chmod 0600 /var/spool/cron/crontabs/www-data
chown www-data:crontab /var/spool/cron/crontabs/www-data

#/etc/msmtprc

if [ ! "$(ls /etc/msmtprc)" ];
then
  cat <<EOF > /etc/msmtprc
  # settings msmtp
  account via_gmail
  host            smtp.gmail.com
  from            **************@gmail.com
  user            **************@gmail.com
  password        **************
  port            587
  auth            on
  tls             on
  tls_starttls    on
  tls_certcheck   off
  protocol        smtp
  logfile         /var/log/msmtp.log

  # Set a default account
  account default : via_gmail
EOF
else
  echo "/etc/msmtprc already exist"
fi

## php
echo "ServerName localhost" >> /etc/apache2/apache2.conf
echo sed -i "s|^upload_max_filesize .*|upload_max_filesize = $GLPI_upload_max_filesize|" /etc/php/7.0/apache2/php.ini
sed -i "s|^post_max_size .*|post_max_size = $GLPI_post_max_size|" /etc/php/7.0/apache2/php.ini
sed -i "s|^memory_limit .*|memory_limit = $GLPI_memory_limit|" /etc/php/7.0/apache2/php.ini
sed -i "s|^max_execution_time .*|max_execution_time = $GLPI_max_execution_time|" /etc/php/7.0/apache2/php.ini

## Zend OPcache
echo "opcache.memory_consumption = 128" >> /etc/php/7.0/mods-available/opcache.ini

echo "apc.shm_size=64M" >> /etc/php/7.0/mods-available/apcu.ini

service cron start
trap "service cron stop; service rsyslog stop; exit" SIGINT SIGTERM

#Activation du module rewrite d'apache
a2enmod rewrite && service apache2 restart && service apache2 stop

/usr/sbin/apache2ctl -D FOREGROUND
