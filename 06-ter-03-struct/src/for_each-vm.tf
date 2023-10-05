data "yandex_compute_image" "xyz" {
  family = var.vm_family
}

resource "yandex_compute_instance" "xyz" {
  platform_id = var.vm_platform
  for_each = toset(keys({for i, r in var.hw:  i => r}))
  name  = var.hw[each.value]["vm_name"]

resources {
    cores  = var.hw[each.value]["cpu"]
    memory = var.hw[each.value]["ram"]
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.xyz.image_id
      size = var.hw[each.value]["disk"]
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
    metadata = {
    ssh-keys = local.key
  }
  depends_on = [
    yandex_compute_instance.web
  ]
}