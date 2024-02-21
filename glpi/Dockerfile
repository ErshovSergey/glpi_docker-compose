version: "3"

services:
  glpi10:
    environment:
      - GLPI_VERSION=${GLPI_VERSION}
      - GLPI_upload_max_filesize=${GLPI_upload_max_filesize}
      - GLPI_post_max_size=${GLPI_post_max_size}
      - GLPI_memory_limit=${GLPI_memory_limit}
      - GLPI_max_execution_time=${GLPI_max_execution_time}
      - MYSQL_DATABASE=${MYSQL_DATABASE}
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
      - MYSQL_USER=${MYSQL_USER}
      - MYSQL_PASSWORD=${MYSQL_PASSWORD}
      - HTTPS_PROXY=${HTTPS_PROXY}
    build:
      context: glpi
      dockerfile: Dockerfile
    privileged: true
    hostname: glpi10
    volumes:
      - "/etc/timezone:/etc/timezone:ro"
      - "/etc/localtime:/etc/localtime:ro"
      - "${GLPI_PATH}/html:/var/www/html"
      - "${GLPI_PATH}/logs/apache2:/var/log/apache2"
    container_name: "${GLPI_NAME}_main"
    links:
      - mysqlfor_glpi10:mysql
    ports:
      -  "${GLPI_HTTP_IP_PORT}:80"
    depends_on:
      - mysqlfor_glpi10
    restart: always

    sysctls:
          net.ipv6.conf.all.disable_ipv6: 0

#    logging:
#      driver: none

  mysqlfor_glpi10:
    image: mysql:8.0.22
    volumes:
      - "/etc/timezone:/etc/timezone:ro"
      - "/etc/localtime:/etc/localtime:ro"
      - "${GLPI_PATH}/mysql_data:/var/lib/mysql"
      - "${GLPI_PATH}/mysql_backup:/mysql_backup"
      - "${GLPI_PATH}/app.cnf:/etc/mysql/conf.d/app.cnf"
    restart: always
    container_name: "${GLPI_NAME}_mysql"
    env_file:
      - ./.env

    cap_add:
      - SYS_NICE  # CAP_SYS_NICE
    command:
     - mysqld
     - --character-set-server=utf8
     - --collation-server=utf8_bin
     - --innodb_page_cleaners=128
     - --default-authentication-plugin=mysql_native_password
     - --join_buffer_size=128M
     - --key_buffer_size=0
     - --innodb_buffer_pool_size=1G
     - --innodb_log_file_size=128M
     - --innodb_buffer_pool_instances=1
    sysctls:
          net.ipv6.conf.all.disable_ipv6: 0
    deploy:
      resources:
        limits:
          memory: 4G
