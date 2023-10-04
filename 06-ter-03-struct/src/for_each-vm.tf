data "yandex_compute_image" "xyz" {
  family = var.vm_family
}

resource "yandex_compute_instance" "xyz" {
  platform_id = var.vm_platform
  for_each = {
    0 = "main"
    1 = "replica"
  }
  name  = "netology-develop-platform-web-${each.key+3}-${each.value}"

resources {
  for_each = {

  }
    cores  = 2
    memory = 1
    core_fraction = 5
  }

variable "hw" {
  type = list(object({
    vm_name = string
    cpu = number
    ram  = number
    disk = number
  }))
  default = [
    { vm_name = "main", cpu = 4, ram = 4, disk = 5 },
    { vm_name = "replica", cpu = 2, ram = 2, disk = 5 },
  ]
}

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.xyz.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
}