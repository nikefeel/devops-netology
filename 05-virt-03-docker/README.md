# Домашнее задание к занятию 3. «Введение. Экосистема. Архитектура. Жизненный цикл Docker-контейнера»

## Задание 1
- создайте свой репозиторий на https://hub.docker.com;
- выберите любой образ, который содержит веб-сервер Nginx;
- создайте свой fork образа;
- реализуйте функциональность: запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:
### Решение
- Ссылка на репозиторий https://hub.docker.com/r/nfeel/nginx
## Задание 2
- Посмотрите на сценарий ниже и ответьте на вопрос: «Подходит ли в этом сценарии использование Docker-контейнеров или лучше подойдёт виртуальная машина, физическая машина? Может быть, возможны разные варианты?»
- Детально опишите и обоснуйте свой выбор.
### Решение

## Задание 3
`# docker ps`

`CONTAINER ID   IMAGE          COMMAND        CREATED         STATUS              PORTS     NAMES`\
`21909aef414a   nfeel/debian   "/sbin/init"   2 seconds ago   Up 1 second                   gracious_noyce`\
`60ad953389f4   nfeel/centos   "/sbin/init"   2 minutes ago   Up About a minute             thirsty_sutherland`
` # docker exec -it thirsty_sutherland ls -l /data`\
`-rw-r--r-- 1 root root 12 Aug 23 16:46 testcentos.txt`\
`-rw-r--r-- 1 root root  9 Aug 23 16:50 testhost.txt`\
` # docker exec -it thirsty_sutherland cat /data/*.txt`\
`testcentos` \
`testhost`\
` # docker exec -it gracious_noyce ls -l /data`\
`-rw-r--r-- 1 root root 12 Aug 23 16:46 testcentos.txt`\
`-rw-r--r-- 1 root root  9 Aug 23 16:50 testhost.txt`\
`# docker exec -it gracious_noyce cat /data/*.txt`\
`testcentos`\
`testhost`\

### Решение
