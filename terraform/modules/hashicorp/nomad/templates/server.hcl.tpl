bind_addr  = "${ipv4_local}"
data_dir   = "${data_dir}"
datacenter = "${datacenter}"
region     = "global"
name       = "${node_name}"

advertise {
  # We need to specify our host's IP because we can't
  # advertise 0.0.0.0 to other nodes in our cluster.
  http = "${ipv4_local}:4646"
  rpc  = "${ipv4_local}:4647"
  serf = "${ipv4_local}:4648"
}
addresses {
  http = "0.0.0.0"
  rpc  = "0.0.0.0"
  serf = "0.0.0.0"
}
acl {
  enabled = false
}
server {
  enabled          = "${is_server}"
  bootstrap_expect = 1
  #heartbeat_grace = "4h"
}
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
tls {
  http                   = true
  rpc                    = true
  ca_file                = "${data_dir}/agent-certs/ca.crt"
  cert_file              = "${data_dir}/agent-certs/agent.crt"
  key_file               = "${data_dir}/agent-certs/agent.key"
  verify_server_hostname = true
  verify_https_client    = true
}
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
