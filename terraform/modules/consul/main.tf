variable "default_user" {}
variable "default_password" {}
variable "host" {}
variable "datacenter" {}
variable "os_distrib_name" {default = "altlinux"}
variable "recursor" {default = "192.168.0.4\",\"192.168.0.3"}
variable "is_server" {default = false}
variable "consul_server_ipv4" { default = ""}

locals {
    config_name = var.is_server==true ? "config.json" : "config.json"
    bootstrap = var.is_server==true ? "\"bootstrap_expect\": 1,":""
    retry_join = var.is_server==true ? "" : var.consul_server_ipv4
}
data "template_file" "consul-config" { 
    template = "${file("${path.module}/templates/config.json.tpl")}"
    vars = {
    is_server = var.is_server
    recursor = var.recursor
    datacenter = var.datacenter
    server_bootstrap = local.bootstrap
    retry_join = local.retry_join
    advertise_addr = var.host
    }
}

resource "null_resource" "consul-server" {

    connection {
        type     = "ssh"
        user     = var.default_user
        password = var.default_password
        host     = var.host
    }
  provisioner "file" {
    source      = "${path.module}/../../../cloud-init/services/consul/unzip_${var.os_distrib_name}.sh"
    destination = "/tmp/unzip_setup.sh"
  }
  provisioner "file" {
    source      = "${path.module}/../../../cloud-init/services/consul/consul_setup.sh"
    destination = "/tmp/consul_setup.sh"
  }
  provisioner "file" {
    content      = data.template_file.consul-config.rendered
    destination = "/tmp/${local.config_name}"
  }
  provisioner "file" {
    source      = "${path.module}/../../../cloud-init/services/consul/enable_service.sh"
    destination = "/tmp/enable_service.sh"
  }
  provisioner "file" {
    source      = "${path.module}/../../../cloud-init/services/consul/consul.service"
    destination = "/tmp/consul.service"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod 740 /tmp/*",
      "chmod 777 /tmp/*.sh",
      "/tmp/unzip_setup.sh",
      "/tmp/consul_setup.sh",
      "/tmp/enable_service.sh"
    ]
  }
}