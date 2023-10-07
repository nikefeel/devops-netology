locals {
  user = "ubuntu"
  key = file("~/.ssh/id_ed25519.pub")
  volumes_ids = { id = yandex_compute_disk.volume[*].id }
}
