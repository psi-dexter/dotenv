


data "template_file" "consul_template_base_config" {
  template = "${file("${path.module}/templates/base.hcl.tpl")}"
  vars = {
    token = var.token
  }
}


data "template_file" "darwin_service" {
  template = "${file("${path.module}/templates/homebrew.mxcl.consul-template.plis.tpl")}"
  vars = {
    config_dir = var.config_dir
  }
}

