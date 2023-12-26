# Домашнее задание к занятию "4. Ansible Roles"

## Задание 1
### Решение

## Clickhouse Vector Lighthouse Ansible-Playbook

Playbook использует роли для настройки\
[Clickhouse](https://github.com/AlexeySetevoi/ansible-clickhouse/tree/1.13)\
[Vector](https://github.com/nikefeel/vector-role/tree/1.2)\
[Lighthouse](https://github.com/nikefeel/lighthouse-role/tree/1.1)


## Установка
Для установки разверните хосты с CentOS 7/8.
- Пропишите хосты в `inventory/prod.yml`
<<<<<<< HEAD
- Скачайте роли `ansible-galaxy install -r requirements.yml -p roles`
=======
- Скачайте роли `ansible-galaxy install -r requirements.yml`
>>>>>>> origin/main
- Запустите playbook `ansible-playbook -i inventory/prod.yml site.yml`
  
## Лицензия
Этот проект использует [MIT License](LICENSE).