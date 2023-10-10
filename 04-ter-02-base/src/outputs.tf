output "external_ip" {
  value = {
    (yandex_compute_instance.platform-web.name) = yandex_compute_instance.platform-web.network_interface[0].nat_ip_address
    (yandex_compute_instance.platform-db.name) = yandex_compute_instance.platform-db.network_interface[0].nat_ip_address
  }
}