# Домашнее задание к занятию 5.3. «Введение. Экосистема. Архитектура. Жизненный цикл Docker-контейнера»

## Задание 1
### Решение
- Ссылка на репозиторий https://hub.docker.com/repository/docker/nfeel/nginx/general
## Задание 2
### Решение
- Высоконагруженное монолитное java веб-приложение - для облегчения миграции можно использовать docker с оптимизированной соответствующим образом JVM или виртуальные машины. Учитывая что приложение монолитное его также можно разместить на физической машине.
- Nodejs веб-приложение - идеально подходит для размещения в контейнере. Т.к снижается время на деплой и внедрение.
- Мобильное приложение c версиями для Android и iOS - виртуальная машина или физическое оборудование.
- Шина данных на базе Apache Kafka - исходя из документации лучшей практикой является размещение на виртуальных машинах.
- Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana - исходя из документации для размещения требуется использование выделенных хостов (виртуальных машин, контейнеров) т.к. некоторые функции Elasticsearch подразумевают что это единственное ресурсоёмкое приложение на хосте.
- Мониторинг-стек на базе Prometheus и Grafana - можно использовать контейнер или виртуальную машину для облегчения развёртывания и масштабирования.
- MongoDB, как основное хранилище данных для java-приложения - можно использовать все три варианта, при этом для Docker потребуется смонтировать внешний том для хранения данных.
- Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry - Gitlab сервер исходя из документации может быть размещён всеми тремя способами. Docker Registry по умолчанию поставляется в контейнере.
## Задание 3
### Решение
`# docker ps`\
`CONTAINER ID   IMAGE          COMMAND        CREATED         STATUS              PORTS     NAMES`\
`21909aef414a   nfeel/debian   "/sbin/init"   2 seconds ago   Up 1 second                   gracious_noyce`\
`60ad953389f4   nfeel/centos   "/sbin/init"   2 minutes ago   Up About a minute             thirsty_sutherland`

`# docker exec -it thirsty_sutherland ls -l /data`\
`-rw-r--r-- 1 root root 12 Aug 23 16:46 testcentos.txt`\
`-rw-r--r-- 1 root root  9 Aug 23 16:50 testhost.txt`\
`# docker exec -it thirsty_sutherland cat /data/*.txt`\
`testcentos` \
`testhost`

`# docker exec -it gracious_noyce ls -l /data`\
`-rw-r--r-- 1 root root 12 Aug 23 16:46 testcentos.txt`\
`-rw-r--r-- 1 root root  9 Aug 23 16:50 testhost.txt`

`# docker exec -it gracious_noyce cat /data/*.txt`\
`testcentos`\
`testhost`

## Задание 4
### Решение
Ссылка на репозиторий https://hub.docker.com/repository/docker/nfeel/ansible/general