data "yandex_compute_image" "db" {
  family = var.vm_family
}

resource "yandex_compute_instance" "db" {
  depends_on = [ yandex_compute_instance.web ]
  for_each = toset(keys({for i, r in var.mainreplica_resources:  i => r}))
  name = "${var.vm_name}-${var.vm_env}-${var.mainreplica_resources[each.value]["vm_name"]}"
  allow_stopping_for_update = true

resources {
    cores  = var.mainreplica_resources[each.value]["cpu"]
    memory = var.mainreplica_resources[each.value]["ram"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.db.image_id
      size = var.mainreplica_resources[each.value]["disk"]
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