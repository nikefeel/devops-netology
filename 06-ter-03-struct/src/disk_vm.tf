resource "yandex_compute_disk" "disk" {
 name     = "disk"
  block_size = 1073741824
  size = 1
 count = 3
 image_id  = "netology-develop-platform-web-${count.index+1}"
}