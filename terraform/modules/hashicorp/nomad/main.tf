data "template_file" "nomad_server_base_config" {
  template = file("${path.module}/templates/server.hcl.tpl")
  vars = {
    node_name  = var.node_name
    ipv4_local = var.ipv4_local
    datacenter = var.datacenter
    data_dir   = var.data_dir
    is_server  = "true"
  }
}
data "template_file" "nomad_client_base_config" {
  template = file("${path.module}/templates/client.hcl.tpl")
  vars = {
    node_name    = "mercury"
    nomad_server = var.ipv4_local
    datacenter   = var.datacenter
    data_dir     = "/var/nomad/client"
    is_server    = "true"
  }
}
data "template_file" "consul_config" {
  template = file("${path.module}/templates/consul.hcl.tpl")
  vars = {
    datacenter   = var.datacenter
    consul_token = "e338ebc0-01a4-3603-45aa-159f18051f82"
    ipv4_local   = "127.0.0.1"
  }
}
