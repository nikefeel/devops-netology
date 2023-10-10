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

variable "vm_family" {
  type        = string
  default     = "debian-12"
}

variable "vm_name" {
  type        = string
  default     = "netology"
}

variable "vm_env" {
  type        = string
  default     = "develop"
}

variable "vm_role_db" {
  type        = string
  default     = "db"
}

variable "vm_role_web" {
  type        = string
  default     = "web"
}

variable "vm_role_storage" {
  type        = string
  default     = "storage"
}

variable "vm_web_resources" {
  type = map
  default = {
  cpu = 2
  ram = 1
  core_fraction = 5
    }
}

variable "vm_db_resources" {
  type = list(object({
    vm_name = string
    cpu = number
    ram  = number
    disk = number
  }))
  default = [
    {
      vm_name = "main"
      cpu = 4
      ram = 4
      disk = 10
    },
    {
      vm_name = "replica"
      cpu = 2
      ram = 2
      disk = 8
    }
  ]
}

variable "vm_storage_resources" {
  type = list(object({
   vm_name = string
    cpu     = number
    ram     = number
    core_fraction    = number
  }))
  default = [
    {
      vm_name = "storage"
      cpu   = 2
      ram   = 2
      core_fraction  = 20
    }
  ]
}