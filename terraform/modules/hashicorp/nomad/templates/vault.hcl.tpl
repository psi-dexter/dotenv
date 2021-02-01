vault {
  enabled          = true
  address          = "http://active.vault.service.consul:8200"
  task_token_ttl   = "1h"
  create_from_role = "nomad-cluster"
  token            = "${vault_token}"
  ca_file          = "/etc/consul.d/tls/consul-agent-ca.pem"
  cert_file        = "/etc/consul.d/tls/${datacenter}-client-consul-0.pem"
  key_file         = "/etc/consul.d/tls/${datacenter}-client-consul-0-key.pem"
  tls_server_name  = "server.${datacenter}.consul"
}
