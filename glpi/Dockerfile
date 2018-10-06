FROM debian:latest

MAINTAINER Sergey Ershov "ershovu@gmail.com"

EXPOSE 80

#Ne pas poser de question à l'installation
#ENV DEBIAN_FRONTEND noninteractive

#Installation d'apache et de php5 avec extension
RUN export DEBIAN_FRONTEND='noninteractive' \
  && apt-get update -qy \
  && apt-get upgrade -qqy \
#####
  && apt-get install -yqq  --no-install-recommends --no-install-suggests locales 
#  && sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
#  && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
#  && dpkg-reconfigure --frontend=noninteractive locales \
#  && locale-gen \
#  && update-locale LANG=ru_RU.UTF-8 \

RUN export DEBIAN_FRONTEND='noninteractive' \
  && sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
  && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
  && dpkg-reconfigure --frontend=noninteractive locales \
  && update-locale LANG=en_US.UTF-8 \
   && set LANGUAGE ru_RU.UTF-8 \
   && set LANG=ru_RU.UTF-8 \
   && set LC_ALL=ru_RU.UTF-8 \
   && locale-gen ru_RU.UTF-8 \
  && dpkg-reconfigure --frontend=noninteractive locales \

#  && echo "LANGUAGE=ru_RU.UTF-8" >> /etc/default/locale \
#  && echo "LC_ALL=ru_RU.UTF-8" >> /etc/default/locale \
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
    php-cas \
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
  ## clean
  && apt-get autoremove -qqy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/*

COPY glpi/entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
