data "yandex_compute_image" "web" {
  family = var.vm_family
}

resource "yandex_compute_instance" "web" {
  count = 2
  name  = "netology-develop-platform-web-${count.index+1}"
  platform_id = var.vm_platform
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.web.image_id
      type = "network-ssd"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = ["${yandex_vpc_security_group.fw.id}"]
  }
    metadata = {
    ssh-keys = "${local.user}:${local.key}"
  }
}