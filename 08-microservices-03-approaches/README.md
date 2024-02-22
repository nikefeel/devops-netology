# Домашнее задание к занятию "3. Микросервисы: подходы"

## Решение
### Задание 1

Публичные облачные платформы содержат все необходимые компоненты для построения CI/CD.\
Например, AWS CodePipeline, Azure DevOps, Google Cloud Build и Alibaba Cloud DevOps Pipeline в одноименных облаках могут быть скомбинированы с сервисами container registry и VCS.\
Из отдельных продуктов, предлагающих CI/CD как сервис, можно выделить gitlab, github/github actions, teamcity, bitbucket. Наиболее подходящим решениями будут gitlab SaaS или github, реализующие все заявленные функции.\
В зависимости от требований к хранению конфиденциальной информации может потребоваться Hashicorp Vault.

## Решение
### Задание 2

ElasticSearch для хранения, FileBeat/Logstash как коллектор, Kibana для отображения.

## Решение
### Задание 3

Prometheus/ElasticSearch для хранения, FileBeat/Logstash как коллектор, Grafana для отображения.