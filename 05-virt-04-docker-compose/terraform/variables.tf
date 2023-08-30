# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1gflnqaensu2ip5bncs"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1gfv0ds10135cd1ngno"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "debian-11-nginx-2023-08-30t07-23-25z" {
  default = "fd84ha8vqd7k76nsgpo3"
}