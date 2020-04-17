output "base_config" {
  value = "${data.template_file.consul_template_base_config.rendered}"
}
output "darwin_service" {
  value = "${data.template_file.darwin_service.rendered}"
}
