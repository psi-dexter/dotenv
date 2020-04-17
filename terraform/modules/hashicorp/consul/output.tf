output "consul_config_base" {
  value = "${data.template_file.consul_nomad_docker.rendered}"
}
