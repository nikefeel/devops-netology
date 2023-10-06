resource "yandex_compute_disk" "disk" {
 size = 1
 count = 3
 name  = "volume-${count.index}"
}

data "yandex_compute_image" "storage" {
  family = var.vm_family
}

resource "yandex_compute_instance" "storage" {

  platform_id = var.vm_platform
  name  = "netology-storage"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.storage.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = [ for volume in var.volumes: volume ]
    content {
   disk_id = yandex_compute_disk.disk[0]
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
    ssh-keys = "ubuntu:local.key"
  }

}