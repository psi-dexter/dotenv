variable "host" {
  type        = string
  description = "describe your variable"
}
variable "host_keyfile" {
  type        = string
  description = "describe your variable"
}

variable "l2tp_config_file" {
  type        = string
  description = "describe your variable"
}
variable "l2tp_config_options_file" {
  type        = string
  description = "describe your variable"
}
variable "ipsec_config_file" {
  type        = string
  description = "describe your variable"
}
variable "ipsec_secrets_file" {
  type        = string
  description = "describe your variable"
}

resource "null_resource" "l2tp_client" {
  connection {
    host        = var.host
    type        = "ssh"
    user        = "root"
    private_key = file(var.host_keyfile)
  }
  triggers = {
    content = var.l2tp_config_file
    content = var.l2tp_config_options_file
    content = var.ipsec_config_file
    content = var.ipsec_secrets_file
  }

  provisioner "file" {
    content     = var.ipsec_config_file
    destination = "/etc/ipsec.conf"
  }
  provisioner "file" {
    content     = var.ipsec_secrets_file
    destination = "/etc/ipsec.secrets"
  }


  provisioner "file" {
    content     = var.l2tp_config_file
    destination = "/etc/xl2tpd/xl2tpd.conf"
  }
  provisioner "file" {
    content     = var.l2tp_config_options_file
    destination = "/etc/ppp/options.l2tpd.client"
  }

}
