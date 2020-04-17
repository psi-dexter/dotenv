module "nomad_server_vik" {
  source       = "../../../modules/hashicorp/nomad"
  os           = "linux"
  datacenter   = var.datacenter
  host_name    = var.host_name
  ipv4_local   = var.ipv4_local
  ipv4_wan     = var.ipv4_wan
  host_keyfile = var.host_keyfile

}
module "nomad_server_bootstrap" {
  source            = "../../../modules/hashicorp/nomad/provision/linux"
  host_keyfile      = var.host_keyfile
  nomad_version     = var.nomad_version
  host              = var.ipv4_wan
  nomad_config_base = module.nomad_server_vik.nomad_server_config
}
output "nomad_server_config" {
  value = "${module.nomad_server_vik.nomad_server_config}"
}

