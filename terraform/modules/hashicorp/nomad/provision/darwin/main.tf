variable "nomad_config_base" {
  type        = "string"
  description = "describe your variable"
}
variable "host_keyfile" {
  type        = "string"
  description = "describe your variable"
}
variable "config_dir" {
  type        = "string"
  description = "describe your variable"
  default     = "/usr/local/etc/nomad.d"
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
    destination = "${var.config_dir}/base.hcl"
  }
  provisioner "file" {
    content     = file("${path.module}/../../templates/homebrew.mxcl.nomad.plist.tpl.xml")
    destination = "/usr/local/opt/nomad/homebrew.mxcl.nomad.plist"
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
