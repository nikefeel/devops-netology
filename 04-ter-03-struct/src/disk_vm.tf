resource "yandex_compute_disk" "volumes" {
  count = 3
  name  = "volume-${count.index+1}"
  size  = 1
}

data "yandex_compute_image" "storage" {
  family = var.vm_family
}

resource "yandex_compute_instance" "storage" {
  for_each = { for server in var.vm_storage_resources : server.vm_name => server }
  name = "${var.vm_name}-${var.vm_env}-${var.vm_role_storage}"
  allow_stopping_for_update = true

resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.storage.image_id
     }
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.volumes.*.id
    content {
      disk_id   = secondary_disk.value
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    security_group_ids = [yandex_vpc_security_group.fw.id]
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
    metadata = {
    serial-port-enable = 1
    ssh-keys = "${local.user}:${local.key}"
  }
}