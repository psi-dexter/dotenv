variable "host_keyfile" {
  type    = string
  default = "~/.ssh/id_rsa"
}
variable "nomad_version" {
  type = string
}
variable "consul_version" {
  type = string
}
variable "ipv4_wan" {

}
variable "ipv4_local" {
  type = string
}
variable "host_name" {
  type = string
}
variable "datacenter" {
  type = string
}

module "nomad_server_vik" {
  source         = "./modules/compute/vik"
  os             = "linux"
  datacenter     = var.datacenter
  host_name      = var.host_name
  ipv4_local     = var.ipv4_local
  ipv4_wan       = var.ipv4_wan
  host_keyfile   = var.host_keyfile
  nomad_version  = var.nomad_version
  consul_version = var.consul_version
}





output "nomad_server_config" {
  value = module.nomad_server_vik.nomad_server_config
}








#output "vault_config_tls" {
#  value = data.template_file.vault_server_tls.rendered
#}

#output "vault_service" {
#  value = "${file("./modules/hashicorp/vault/templates/vault.service")}"
#}



