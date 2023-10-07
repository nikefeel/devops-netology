resource "yandex_compute_disk" "volume" {
 size = 1
 count = 3
 type = "network-ssd"
 name  = "volume-${count.index}"
}

data "yandex_compute_image" "storage" {
  family = var.vm_family
}

resource "yandex_compute_instance" "storage" {
  name  = "netology-storage"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.storage.image_id
      type = "network-ssd"
    }
  }

# dynamic "secondary_disk" {
#    for_each = yandex_compute_disk.volume
#    content {
#      disk_id   = local.volumes_ids.id
#    }
#  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

    metadata = {
    ssh-keys = "${local.user}:${local.key}"
  }
    depends_on = [
    yandex_compute_instance.db
  ]
}

output "id" {
  value = var.servers_group
}