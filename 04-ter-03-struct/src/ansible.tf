resource "local_file" "hosts_cfg" {
  filename = "${abspath(path.module)}/hosts.cfg"
  content = templatefile("${path.module}/hosts.tftpl", {
      webservers  = yandex_compute_instance.web
      databases   = yandex_compute_instance.db
      storage     = yandex_compute_instance.storage
    }
  )
}

resource "null_resource" "all_hosts_provision" {
    provisioner "local-exec" {
    command = "sleep 300"
  }
    provisioner "local-exec" {
    command = "cat ~/.ssh/id_ed25519.pub | ssh-add"
  }
  provisioner "local-exec" {
    command  = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/hosts.cfg ${abspath(path.module)}/soft.yml"
    on_failure = continue
    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
  }
    triggers = {
      always_run         = "${timestamp()}"
      playbook_src_hash  = file("${abspath(path.module)}/soft.yml")
      ssh_public_key     = "${local.user}:${local.key}"
    }
}