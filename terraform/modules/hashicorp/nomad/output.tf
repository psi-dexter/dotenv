output "base_server_config" {
  value = data.template_file.nomad_server_base_config.rendered
}
output "base_client_config" {
  value = data.template_file.nomad_client_base_config.rendered
}
output "consul_config" {
  value = data.template_file.consul_config.rendered
}
