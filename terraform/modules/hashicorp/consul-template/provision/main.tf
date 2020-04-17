

resource "null_resource" "vik_consul-template" {
  connection {
    host        = var.host
    type        = "ssh"
    user        = "root"
    private_key = file(var.host_keyfile)
  }
  triggers = {
    content = "${data.template_file.consul_template_config_base.rendered}"
    content = "${data.template_file.consul_template_config_nomad.rendered}"
  }

  provisioner "file" {
    content     = data.template_file.consul_template_config_base.rendered
    destination = "/etc/consul-template.d/base.hcl"
  }
  provisioner "file" {
    content     = data.template_file.consul_template_config_nomad.rendered
    destination = "/etc/consul-template.d/nomad.hcl"
  }
  provisioner "file" {
    content     = file("${path.module}/../scripts/install.sh")
    destination = "/tmp/consul-template_install.sh"
  }

  provisioner "file" {
    content     = file("${path.module}/../templates/consul-template.service")
    destination = "/etc/systemd/system/consul-template.service"
  }

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    inline = [
      "chmod +x /tmp/consul-template_install.sh",
      "/tmp/consul-template_install.sh 0.24.0"
      #"cd /etc/consul.d/tls && consul tls ca create",
      #"cd /etc/consul.d/tls && consul tls cert create -server -dc=${var.datacenter}",
      #  "consul tls cert create -cli -dc=${var.datacenter}",
      #  "consul tls cert create -client -dc=${var.datacenter}",


    ]
  }
}

output "consul_template_config_base" {
  value = data.template_file.consul_template_config_nomad.rendered
}

output "consul_template_service" {
  value = "${file("./modules/hashicorp/consul-template/templates/consul-template.service")}"
}

