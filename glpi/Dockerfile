FROM debian:stretch
MAINTAINER Sergey Ershov "ershovu@gmail.com"
ENV DEBIAN_FRONTEND noninteractive

RUN cd /tmp/ \
  && apt update -qqy \
  && apt upgrade -qqy \
# локаль
  && apt install -yqq  --no-install-recommends --no-install-suggests locales apt-utils

ENV LANG='ru_RU.UTF-8' LANGUAGE='ru_RU.UTF-8' LC_ALL='ru_RU.UTF-8'
RUN echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen && locale-gen

RUN cd /tmp/ \
 # timezone
  && ln -sf /usr/share/zoneinfo/Europe/Moscow  /etc/localtime && dpkg-reconfigure -f noninteractive tzdata \
 # install
  && apt -y install \
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
    php7.0-zip \
    cron \
    rsyslog \
    wget \
    graphviz \
  ## clean
  && apt autoremove -qqy \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* /tmp/*

COPY entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
