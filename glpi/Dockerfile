FROM debian:latest

MAINTAINER Sergey Ershov "ershovu@gmail.com"

EXPOSE 80

#Ne pas poser de question à l'installation
#ENV DEBIAN_FRONTEND noninteractive

#Installation d'apache et de php5 avec extension
RUN export DEBIAN_FRONTEND='noninteractive' \
  && apt-get update -qy \
  && apt-get upgrade -qqy \
  ## Set LOCALE to UTF8
  && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
  && echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen  \
  && apt-get install -yqq  --no-install-recommends --no-install-suggests locales \
  && echo "LANG=\"ru_RU.UTF-8\"" > /etc/default/locale \
  && echo "LC_ALL=\"ru_RU.UTF-8\"" >> /etc/default/locale \
  && locale-gen ru_RU.UTF-8 \
  && export LANG=ru_RU.UTF-8 \
  # удаляем все локали кроме этих
  && locale-gen --purge ru_RU.UTF-8 en_US.UTF-8 \
  # timezone
  && ln -sf /usr/share/zoneinfo/Europe/Moscow  /etc/localtime && dpkg-reconfigure -f noninteractive tzdata \
  && apt-get -y install \
    apache2 \
    php \
    php-mysql \
    php-ldap \
    php-xmlrpc \
    php-imap \
    curl \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-apcu-bc \
    cron msmtp \
    rsyslog \
    wget \
    graphviz \
  ##  msmtprc
  && rm -f /etc/msmtprc \
  && ln -sf /var/www/html/msmtprc /etc/msmtprc \
  # replace sendmail
  && rm /usr/sbin/sendmail \
  && ln -s /usr/bin/msmtp /usr/sbin/sendmail \
# apc
#  && echo [apcu] >>            /etc/php/7.0/apache2/php.ini \
#  && echo extension=apcu.so >> /etc/php/7.0/apache2/php.ini \
#  && echo extension=apc.so >>  /etc/php/7.0/apache2/php.ini \
#  && echo apc.enabled=1 >>     /etc/php/7.0/apache2/php.ini \
  ## clean
  && apt-get autoremove -qqy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/*


COPY glpi/entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
