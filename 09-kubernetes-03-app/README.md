# Домашнее задание к занятию "1.3 Запуск приложений в K8S"

## Решение
### Задание 1
Создан deployment двух контейнеров в поде

![](./img/deploy_before.png)

Увеличено количество реплик
![](./img/deploy_after.png)

Созданы сервисы
![](./img/service.png)

Соединение из отдельного пода multitool

![](./img/curlnginx.png)

![](./img/curlmultitool.png)

Манифесты\
[nginx](nginx.yaml)\
[multitool](multitool.yaml)\
[multitool-pod](multitool-pod.yaml)\
[service-nginx](svc-nginx.yaml)\
[service-multitool](svc-multitool.yaml)

## Решение
### Задание 2

![](./img/pod_before.png)

![](./img/pod_after.png)

Манифесты\
[nginx](nginx-pod.yaml)