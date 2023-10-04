data "yandex_compute_image" "xyz" {
  family = var.vm_family
}

resource "yandex_compute_instance" "xyz" {
  platform_id = var.vm_platform
  for_each = {
    0 = "main"
    1 = "replica"
  }
  name  = "netology-develop-platform-web-${var.hw.vm_name.main}"

resources {
  for_each = {
  }
    cores  = var.hw.cpu
    memory = var.hw.ram
    //disk = var.hw.disk
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