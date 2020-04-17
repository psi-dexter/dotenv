

data "template_file" "l2tp-xl2tpd-client" {
  template = file("${path.module}/templates/xl2tpd.conf.tpl")
  vars = {
    l2tp_ipv4 = var.l2tp_ipv4
    name      = var.name
  }
}
data "template_file" "l2tp-xl2tpd-client-opts" {
  template = file("${path.module}/templates/options.l2tpd.client.tpl")

  vars = {
    user     = var.user
    password = var.password
  }
}


data "template_file" "l2tp-ipsec-client" {
  template = file("${path.module}/templates/ipsec.conf.tpl")
  vars = {

    l2tp_ipv4 = var.l2tp_ipv4
  }
}

data "template_file" "l2tp-ipsec-secrets" {
  template = file("${path.module}/templates/ipsec.secrets.tpl")

  vars = {
    pre_shared_key = var.pre_shared_key

  }
}
