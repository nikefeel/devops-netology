# Домашнее задание к занятию "3. Использование Ansible"

## Задание 1
### Решение

## Nginx, ClickHouse, LightHouse and Vector installation

This ansible playbook supports the following,

- Install and configure for CentOS 7 (escalate with `become: true`) Nginx, ClickHouse, LightHouse and Vector by yum.
- Create database `logs` for ClickHouse with errors check.
- Replace default config of Vector and Nginx with jinja2 template.
- After install tell handlers for enable services in systemd.
- If SElinux is enabled set permission for LightHouse read directory `chcon -R -t httpd_sys_content_t /var/www/lighthouse` and set permission for Nginx Proxy_Pass `setsebool -P httpd_can_network_connect 1`

## Prerequisite

Ansible 2.10+\
Ansible-lint
Jinja2

## Configure
Refer the file `group_vars/clickhouse.yml`, `group_vars/lighthouse.yml` and `group_vars/vector.yml` to change the versions,
`inventory/prod.yml` to change hosts ip and username.\
Vector template are in `templates/vector.j2`, you need to set endpoint and logs.
## Check errors
Run `ansible-lint playbook/site.yml`\
If you will see\
```Passed: 0 failure(s), 0 warning(s) on 1 files. Last profile that met the validation criteria was 'production'.``` go to next step, another - fix the errors.
## Install
Deploy with ansible playbook - run the playbook
`ansible-playbook -i playbook/inventory/prod.yml playbook/site.yml`

