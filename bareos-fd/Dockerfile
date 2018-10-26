FROM debian:jessie

ENV TERM linux

ENV DEBIAN_FRONTEND noninteractive

ENTRYPOINT ["/entrypoint.sh"]

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
  && locale-gen --purge ru_RU.UTF-8 en_US.UTF-8

RUN export DEBIAN_FRONTEND='noninteractive' \
  && apt-get -yqq install --no-install-recommends bareos-filedaemon mysql-client-5.5 \
  && apt-get autoremove -qqy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/*


COPY [ "add/", "/" ]
RUN chmod +x /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]

