#resource "local_file" "ansible_inventory" {
#  filename = "./inventory"
#  content  = templatefile("${path.module}/hosts.tftpl", {
#    webservers = yandex_compute_instance.web[*].network_interface[0].nat_ip_address
#    databases  = yandex_compute_instance.db[*].network_interface[0].nat_ip_address
#    storage    = yandex_compute_instance.storage[*].network_interface[0].nat_ip_address
#  })
#}