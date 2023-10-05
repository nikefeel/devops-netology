###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_platform" {
  type        = string
  default     = "standard-v1"
}

variable "vm_family" {
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "hw" {
  type = list(object({
    vm_name = string
    cpu = number
    ram  = number
    disk = number
  }))
  default = [
    { vm_name = "netology-develop-platform-main", cpu = 4, ram = 4, disk = 10 },
    { vm_name = "netology-develop-platform-replica", cpu = 2, ram = 2, disk = 5 }
  ]
}