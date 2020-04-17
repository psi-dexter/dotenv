module "consul_server_fenix" {
  source     = "../../../modules/hashicorp/consul"
  os         = "linux"
  datacenter = var.datacenter
  host_name  = var.host_name
  ipv4_local = var.ipv4_local
  ipv4_wan   = var.ipv4_wan
}
module "consul_server_bootstrap" {
  source             = "../../../modules/hashicorp/consul/provision"
  host_keyfile       = var.host_keyfile
  consul_version     = var.consul_version
  host               = var.ipv4_local
  consul_config_base = module.consul_server_fenix.consul_config_base
}
output "nomad_server_config" {
  value = module.consul_server_fenix.consul_config_base
}

