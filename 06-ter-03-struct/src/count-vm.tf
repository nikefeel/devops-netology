data "yandex_compute_image" "web" {
  family = var.vm_family
}

resource "yandex_compute_instance" "web" {
  count = 2
  name = "${var.vm_name}-${var.vm_env}-${var.vm_role_web}-${count.index+1}"
  allow_stopping_for_update = true

  resources {
    cores         = var.vm_web_resources.cpu
    memory        = var.vm_web_resources.ram
    core_fraction = var.vm_web_resources.core_fraction
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
    security_group_ids = ["${yandex_vpc_security_group.fw.id}"]
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
    metadata = {
    ssh-keys = "${local.user}:${local.key}"
  }
}