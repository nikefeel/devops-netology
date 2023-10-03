variable "vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
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

variable "vm_platform" {
  type        = string
  default     = "standard-v1"
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
  type = map
  default = {
  cpu = 2
  ram = 1
  core_fraction = 20
    }
}

variable "ssh" {
   type = map
  default = {
    port = 1
    key = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN4A4LfOChzEcL1wsV8XcYeeEIBsm6an8OgLQVF2cWSH"
  }
}

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
  description = "VPC network & subnet name"
}
