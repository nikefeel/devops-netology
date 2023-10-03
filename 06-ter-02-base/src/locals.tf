locals {
name_web = "netology-${ var.vm_env }-${var.vm_role_web}"
name_db  = "netology-${ var.vm_env }-${var.vm_role_db}"

vm_web_resources = {
    "cores"=2
    "memory"=1
    "core_fraction"=5
  }
vm_db_resources = {
    "cores"=2
    "memory"=2
    "core_fraction"=20
  }

ssh = {
    port = 1
    keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}