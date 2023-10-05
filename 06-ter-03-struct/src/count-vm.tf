data "yandex_compute_image" "web" {
  family = var.vm_family
}

resource "yandex_compute_instance" "web" {
  platform_id = var.vm_platform
  count = 2
  name  = "netology-develop-platform-web-${count.index+1}"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.web.image_id
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
}