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