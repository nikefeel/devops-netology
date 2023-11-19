# Домашнее задание к занятию "5. Оркестрация кластером Docker контейнеров на примере Docker Swarm"

## Задание 1
### Решение
- Replicated-режим создает заданное количество контейнеров на всех доступных нодах. Global-режим создает сервис в одном экземпляре на всех доступных нодах.
- Используется алгоритм Raft. Менеджеры в кластере обмениваются между собой информацией, при выходе из строя одного менеджера происходит голосование на выбор нового менеджера.
- Overlay-сеть - это сеть, которая объединяет докер-контейнеры с разных физических машин в одну подсеть.

## Задание 2
### Решение
```
root@manager-1:~# docker node ls
ID                            HOSTNAME    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
mgjamdda9rv3hevcpl4v1p5pe *   manager-1   Ready     Active         Leader           20.10.24+dfsg1
mwnqcnhwsojc9h6gw891446uh     manager-2   Ready     Active         Reachable        20.10.24+dfsg1
vowhd3w7gx7oig4n5yzpaor7e     manager-3   Ready     Active         Reachable        20.10.24+dfsg1
eozvemwz8v3u0lqotsyu3hk1g     worker-1    Ready     Active                          20.10.24+dfsg1
llqflemkqlkssnjssbmy1bbsd     worker-2    Ready     Active                          20.10.24+dfsg1

```

## Задание 3
### Решение

## Задание 4
### Решение
