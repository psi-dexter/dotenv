module "consul_server" {
  source         = "./consul"
  node_name      = "mercury-server"
  advertise_ipv4 = "138.197.181.95"
  token          = "secret_token"
  cert_file      = "/etc/consul.d/tls/dc1-server-consul-0.pem"
  key_file       = "/etc/consul.d/tls/dc1-server-consul-0-key.pem"
}
module "consul_agent" {
  source         = "./consul"
  node_name      = "mercury-agent"
  advertise_ipv4 = "10.19.0.5"
  port_shift     = 10
  token          = "secret_token"
  cert_file      = "/etc/consul.d/tls/dc1-client-consul-0.pem"
  key_file       = "/etc/consul.d/tls/dc1-client-consul-0-key.pem"
}
module "consul_agent_office" {
  source         = "./consul"
  node_name      = "office-ci"
  advertise_ipv4 = "192.168.255.6"
  token          = "secret_token"
  cert_file      = "/etc/consul.d/tls/dc1-client-consul-1.pem"
  key_file       = "/etc/consul.d/tls/dc1-client-consul-1-key.pem"
}
module "consul_agent_psfpp" {
  source         = "./consul"
  node_name      = "psfpp"
  advertise_ipv4 = "192.168.255.1"
  token          = "secret_token"
  cert_file      = "/etc/consul.d/tls/dc1-client-consul-2.pem"
  key_file       = "/etc/consul.d/tls/dc1-client-consul-2-key.pem"
}


output "consul_client_config" {
  value = module.consul_agent.client_config
}
output "consul_server_config" {
  value = module.consul_server.server_config
}
output "consul_client_config_office" {
  value = module.consul_agent_office.client_config
}
output "consul_client_config_psfpp" {
  value = module.consul_agent_psfpp.client_config
}
