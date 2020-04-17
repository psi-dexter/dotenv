
variable "host_keyfile" {
  type        = "string"
  description = "describe your variable"
}

variable "host" {
  type        = "string"
  description = "describe your variable"
}
variable "host_user" {
  type        = "string"
  description = "describe your variable"
}
variable "config_dir" {
  type        = "string"
  description = "describe your variable"
  default     = "/usr/local/etc/consul-template.d"
}
variable "base_config_content" {
  type        = "string"
  description = "describe your variable"
}
variable "os_service_definition" {
  type        = "string"
  description = "describe your variable"
}
variable "os_service_definition_path" {
  type        = "string"
  description = "describe your variable"
  default     = "/usr/local/opt/consul/homebrew.mxcl.consul-template.plist"
}



resource "null_resource" "darwin_consul_template" {
  connection {
    host        = var.host
    type        = "ssh"
    user        = var.host_user
    private_key = file(var.host_keyfile)
  }
  triggers = {
    content = "${var.base_config_content}"
  }

  provisioner "file" {
    content     = var.base_config_content
    destination = "${var.config_dir}/base.hcl"
  }

  provisioner "file" {
    content     = var.os_service_definition
    destination = var.os_service_definition_path
  }

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    inline = [
      "cat ${var.os_service_definition_path}"
      #"chmod +x /tmp/consul-template_install.sh",
      #"/tmp/consul-template_install.sh 0.24.0"
      #"cd /etc/consul.d/tls && consul tls ca create",
      #"cd /etc/consul.d/tls && consul tls cert create -server -dc=${var.datacenter}",
      #  "consul tls cert create -cli -dc=${var.datacenter}",
      #  "consul tls cert create -client -dc=${var.datacenter}",


    ]
  }
}

output "consul_template_service" {
  value = var.os_service_definition
}
output "config_dir" {
  value = var.config_dir
}

