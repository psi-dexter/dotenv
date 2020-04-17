bind_addr = "0.0.0.0"
data_dir = "${data_dir}"
datacenter = "${datacenter}"
region = "global"
name = "${node_name}"


client {
  enabled = true
  servers = ["10.8.0.1:4647"]
  network_speed = 10000
  max_kill_timeout = "90s"
  options {
    "driver.raw_exec.enable" = "1"
  }
}


tls {
  http                   = true
  rpc                    = true
  ca_file                = "/usr/local/etc/nomad.d/tls/ca.crt"
  cert_file              = "/usr/local/etc/nomad.d/tls/cl.agent.crt"
  key_file               = "/usr/local/etc/nomad.d/tls/cl.agent.key"
  verify_server_hostname = true
  verify_https_client    = false
}
consul {
  address          = "${ipv4_local}:8501"
  ca_file          = "/usr/local/etc/consul.d/tls/consul-agent-ca.pem"
  cert_file        = "/usr/local/etc/consul.d/tls/${datacenter}-client-consul-0.pem"
  key_file         = "/usr/local/etc/consul.d/tls/${datacenter}-client-consul-0-key.pem"
  ssl              = true
  auto_advertise   = true
  server_auto_join = true
  client_auto_join = true
}