output "xl2tpd-client" {
  value = data.template_file.l2tp-xl2tpd-client.rendered
}
output "xl2tpd-client-opts" {
  value = "${data.template_file.l2tp-xl2tpd-client-opts.rendered}"
}


output "l2tp-ipsec-client" {
  value = data.template_file.l2tp-ipsec-client.rendered
}
output "l2tp-ipsec-secrets" {
  value = "${data.template_file.l2tp-ipsec-secrets.rendered}"
}
