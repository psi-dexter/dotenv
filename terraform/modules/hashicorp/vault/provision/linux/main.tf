resource "null_resource" "vik_vault" {
  connection {
    host        = var.host
    type        = "ssh"
    user        = "root"
    private_key = file(var.host_keyfile)
  }
  triggers = {
    content = "${data.template_file.vault_server_tls.rendered}"
  }
  provisioner "file" {
    content     = file("./modules/hashicorp/vault/templates/vault.service")
    destination = "/etc/systemd/system/vault.service"
  }
  provisioner "file" {
    content     = file("./modules/hashicorp/vault/scripts/install.sh")
    destination = "/tmp/vault_install.sh"
  }
  provisioner "file" {
    content     = data.template_file.vault_server_tls.rendered
    destination = "/etc/vault.d/base.hcl"
  }
  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    inline = [
      "chmod +x /tmp/vault_install.sh",
      "/tmp/vault_install.sh",
      "mkdir -p /etc/vault.d/tls ||echo 'already exists' "

    ]
  }
}
