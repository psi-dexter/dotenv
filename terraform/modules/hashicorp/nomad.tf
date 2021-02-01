module "nomad_server" {
  source     = "./nomad"
  node_name  = "mercury-server"
  ipv4_local = "138.197.181.95"
}
output "nomad_server_config" {
  value = module.nomad_server.base_server_config
}
output "nomad_client_config" {
  value = module.nomad_server.base_client_config
}
output "nomad_consul_config" {
  value = module.nomad_server.consul_config
}
