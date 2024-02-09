# Домашнее задание к занятию "2. Микросервисы: принципы"

## Решение
### Задание 1

Некоторый исходный список ПО, реализующего функционал API Gateways, можно получить со страницы [CNCF Landscape](https://landscape.cncf.io/guide#orchestration-management--api-gateway).
Помимо указанных self-hosted решений существует множество SaaS продуктов, предлагаемых в составе публичных облаков или отдельных сервисов. Например, подобные есть в AWS, Azure, Alibaba Cloud, Oracle Cloud, F5 Network и тд. 


| Name      | Routing on config | Auth | HTTPS Termination |
| :---:     |    :---:          |:----:|:-----------------:|
| [emissary-ingress](https://github.com/emissary-ingress/emissary) | + |  +   |         +         |
| [apache/apisix](https://github.com/apache/apisix) | + |  +   |         +         |
| [megaease/easegress](https://github.com/megaease/easegress) | + |  +   |         +         |
| [solo-io/gloo](https://github.com/solo-io/gloo) | + |  +   |         +         |
| [kong](https://github.com/Kong/kong) | + |  +   |         +         |
| [krakend](https://github.com/luraproject/lura) | + |  +   |         +         |
| [reactive-interaction-gateway](https://github.com/accenture/reactive-interaction-gateway) | + |  +   |         +         |
| [tyk](https://github.com/TykTechnologies/tyk) | + |  +   |         +         |
| [wso2](https://github.com/wso2/product-microgateway) | + |  +   |         +         |
| [gravitee](https://github.com/gravitee-io/gravitee-api-management) | + |  +   |         +         |

Можно рассмотреть выбор из `gravitee` (по набору критериев из [этой статьи](https://habr.com/ru/post/665558/)), `kong` (наибольшее сообщество), `Apache Apisix` (проект под крылом известной компании), `tyk`. С использованием выбранных продуктов можно провести PoC, по результатам которого и выбрать необходимое решение.

## Решение
### Задание 2

Воспользуемся списком из [этой статьи CNCF](https://landscape.cncf.io/guide#app-definition-and-development--streaming-messaging).

| Name      | Cluster |   Persistance    |  Speed | Multiformat | ACLs | Adm. overhead |
| :---:     |  :---:  |     :---:        | :---:  |      :---:  | :--: |        :---:  |
| [nats](https://github.com/nats-io/nats-server) | + | + | fast | custom | + | + |
| [Apache RocketMQ](https://github.com/apache/rocketmq) | + | + | average | TCP, JMS, OpenMessaging | + | + |
| [EMQX](https://github.com/emqx/emqx) | + | + | average | MQTT | + | + |
| [Apache kafka](https://github.com/apache/kafka) | + | + | fast | custom | + | - |
| [kubemq](https://github.com/kubemq-io/kubemq-community) | + | + | fast | custom | + | + |
| [Apache pulsar](https://github.com/apache/pulsar) | + | + | average | custom | + | + |
| [rabbitmq](https://github.com/rabbitmq/rabbitmq-server) | + | + | average | STOMP, AMQP, MQTT | + | + |
| [Apache ActiveMQ](https://github.com/apache/activemq) | + | + | average | OpenWire, STOMP, AMQP, MQTT, JMS | + | + |
| [redis](https://github.com/redis/redis) | + | + | average | custom | + | + |

При выборе решения нужно выбрать между производительностью и функциональностью. Лучшие результаты в бенчмарках показывают брокеры, использующие собственные протоколы. Среди наиболее производительных можно выделить `kafka` (наиболее популярен) и `nats`. `kafka` сложнее в эксплуатации, поскольку для работы использует `zookeeper`.  
Среди мультипротокольных решений можно выделить `activemq`, `rocketmq`, `rabbitmq`. В зависимости от архитектуры, требующихся функций и выбранного формата сообщений каждый из них может показать хорошие результаты.