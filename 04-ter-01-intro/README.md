# Домашнее задание к занятию "6.1. Введение в Terraform"

## Задание 1
### Решение
```
Initializing the backend...

Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "~> 3.0.1"...
- Finding latest version of hashicorp/random...
- Installing kreuzwerker/docker v3.0.2...
- Installed kreuzwerker/docker v3.0.2 (unauthenticated)
- Installing hashicorp/random v3.5.1...
- Installed hashicorp/random v3.5.1 (unauthenticated)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!
```

## Задание 2
### Решение
`personal.auto.tfvars`\
файлы с расширением `.terraform` и `.tfstate`

## Задание 3
### Решение
 `"result": "j0MNVh8JxAnsk2Da",`

## Задание 4
### Решение
`Error: Missing name for resource`

Ресурс должен содержать тип и имя

`Error: Invalid resource name`

Имя ресурса должно начинаться с буквы или нижнего подчеркивания, а не цифры.

## Задание 5
### Решение
```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "${random_password.random_string.result}"
```

```
$ docker ps    
CONTAINER ID   IMAGE          COMMAND                  CREATED        STATUS        PORTS                  NAMES
6e99ba4a21dd   61395b4c586d   "/docker-entrypoint.…"   1 second ago   Up 1 second   0.0.0.0:8000->80/tcp   wzO97jxbmFdckuwJ
```

## Задание 6
### Решение

Опасность применения `-auto-approve` в том, что невозможно просмотреть изменения до применения.
Можно совершить ошибку и применить ее.

```
$ docker ps                   
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS        PORTS                  NAMES
fe1034ad9eda   61395b4c586d   "/docker-entrypoint.…"   3 seconds ago   Up 1 second   0.0.0.0:8000->80/tcp   hello_world
```
## Задание 7
### Решение

```
{
  "version": 4,
  "terraform_version": "1.5.7",
  "serial": 24,
  "lineage": "6bb8a87b-8a3f-ca97-2bc8-111e7850a78c",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```
## Задание 8
### Решение
в `main.tf` для образа установлено `keep_locally = true`

`keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.`