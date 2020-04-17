variable "nomad_config_base" {
  type        = "string"
  description = "describe your variable"
}
variable "host_keyfile" {
  type        = "string"
  description = "describe your variable"
}

resource "null_resource" "nomad_server" {
  connection {
    host        = var.host
    type        = "ssh"
    user        = "root"
    private_key = file(var.host_keyfile)
  }
  triggers = {
    content = "${var.nomad_config_base}"
  }
  provisioner "file" {
    content     = var.nomad_config_base
    destination = "/etc/nomad.d/base.hcl"
  }
  provisioner "file" {
    content     = file("${path.module}/../../scripts/install.sh")
    destination = "/tmp/nomad_install.sh"
  }
  provisioner "file" {
    content     = file("${path.module}/../../scripts/firewall.sh")
    destination = "/tmp/nomad_firewall.sh"
  }
  provisioner "file" {
    content     = file("${path.module}/../../templates/nomad.service")
    destination = "/etc/systemd/system/nomad.service"
  }
  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    inline = [
      "chmod +x /tmp/nomad_install.sh",
      "chmod +x /tmp/nomad_firewall.sh",
      "/tmp/nomad_install.sh",
      "/tmp/nomad_firewall.sh"
    ]
  }
}
