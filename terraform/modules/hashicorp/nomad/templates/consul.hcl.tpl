consul {
  address          = "${ipv4_local}:8501"
  ca_file          = "/etc/consul.d/tls/consul-agent-ca.pem"
  cert_file        = "/etc/consul.d/tls/${datacenter}-client-consul-0.pem"
  key_file         = "/etc/consul.d/tls/${datacenter}-client-consul-0-key.pem"
  ssl              = true
  auto_advertise   = true
  server_auto_join = true
  client_auto_join = true
  token            = "${consul_token}"
}