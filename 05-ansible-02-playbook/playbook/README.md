# Домашнее задание к занятию "2. Работа с Playbook"

## Задание 1
### Решение

## ClickHouse and Vector installation

This ansible playbook supports the following,

- Install and configure for CentOS 7 (escalate with `become: true`) needed versions of ClickHouse and Vector by yum.
- Create database `logs` for ClickHouse with errors check.
- Replace default config of Vector with jinja2 template.
- After install tell handlers for enable services in systemd.

## Prerequisite

Ansible 2.10+\
Jinja2

## Configure
Refer the file `group_vars/clickhouse/vars.yml` and `group_vars/vector/vars.yml` to change the versions,
`inventory/prod.yml` to change hosts ip and username.\
Vector template are in `templates/vector.j2`
## Check errors
Run `ansible-lint playbook/site.yml`\
If you will see\
```Passed: 0 failure(s), 0 warning(s) on 1 files. Last profile that met the validation criteria was 'production'.``` go to next step, another - fix the errors.
## Install
Deploy with ansible playbook - run the playbook
`ansible-playbook -i playbook/inventory/prod.yml playbook/site.yml`

