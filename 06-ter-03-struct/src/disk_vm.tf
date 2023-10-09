resource "yandex_compute_disk" "volume" {
 size = 1
 count = 3
 name  = "volume-${count.index}"
}

data "yandex_compute_image" "storage" {
  family = var.vm_family
}

resource "yandex_compute_instance" "storage" {
  depends_on = [ yandex_compute_instance.db ]
  name = "${var.vm_name}-${var.vm_env}-${var.vm_role_storage}"
  allow_stopping_for_update = true

resources {
    cores         = var.vm_db_resources.cpu
    memory        = var.vm_db_resources.ram
    core_fraction = var.vm_db_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.storage.image_id
     }
  }
 dynamic "secondary_disk" {
    for_each = yandex_compute_disk.volume.*.id
    content {
      disk_id   = yandex_compute_disk.volume.name
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