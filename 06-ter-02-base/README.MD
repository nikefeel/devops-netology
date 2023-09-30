# Домашнее задание к занятию "6.2. Введение в Terraform"

## Задание 1
### Решение

```Error: Error while requesting API to create instance: server-request-id = 64a9551d-adeb-4020-b2e2-02c386b07c4c server-trace-id = a3a6f107ed5193f:868767b49fd53c67:a3a6f107ed5193f:1 client-request-id = ac0b4827-9e06-4731-9e56-f14c9d9cfdc7 client-trace-id = 9ca767e9-74b3-4a42-bddc-f68ffad12170 rpc error: code = FailedPrecondition desc = Platform "standart-v4" not found```

Ошибка в слове standart и платформы v4 нет в YC. используем standard-v3

```Error: Error while requesting API to create instance: server-request-id = 41435342-37e5-4cd1-b8a2-ff0aa2ed3b24 server-trace-id = 3894eab53c5bdcc8:bcf484ce1ba0e678:3894eab53c5bdcc8:1 client-request-id = a42b9fad-79f9-4479-8584-521fe4998de5 client-trace-id = 7669206a-b524-41b8-ab47-a2cd41a276db rpc error: code = InvalidArgument desc = the specified core fraction is not available on platform "standard-v3"; allowed core fractions: 20, 50, 100```

Использование vCPU возможно на 20, 50, 100%

```Error: Error while requesting API to create instance: server-request-id = 86b3814d-1569-4c88-ac09-557bfdf0a14f server-trace-id = 5613ad4ae95a448e:a95b6546b78e8e16:5613ad4ae95a448e:1 client-request-id = 96d51ccf-2973-4694-b1fa-e601438308d9 client-trace-id = d6c4f90c-5e31-4c8a-92f1-d0517048d8ea rpc error: code = InvalidArgument desc = the specified number of cores is not available on platform "standard-v3"; allowed core number: 2, 4```

Количество ядер должно быть 2 или 4.

![](./img/yc.png)

![](./img/ubuntu.png)

## Задание 2
### Решение