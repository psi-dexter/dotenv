data "template_file" "client_config" {
  template = file("${path.module}/templates/client.json.tpl")

  vars = {
    datacenter     = var.datacenter
    node_name      = var.node_name
    token          = var.token
    ca_file        = var.ca_file
    cert_file      = var.cert_file
    key_file       = var.key_file
    advertise_ipv4 = var.advertise_ipv4
    dns            = var.port_shift != 0 ? -1 : 53
    http           = 8500 + var.port_shift
    https          = 8501
    grpc           = 8502 + var.port_shift
    serf_lan       = 8301 + var.port_shift
    serf_wan       = 8302 + var.port_shift
  }
}
data "template_file" "server_config" {
  template = file("${path.module}/templates/server.json.tpl")

  vars = {
    datacenter     = var.datacenter
    node_name      = var.node_name
    advertise_ipv4 = var.advertise_ipv4
    token          = var.token
    ca_file        = var.ca_file
    cert_file      = var.cert_file
    key_file       = var.key_file
  }
}
output "client_config" {
  value = data.template_file.client_config.rendered
}

output "server_config" {
  value = data.template_file.server_config.rendered
}
