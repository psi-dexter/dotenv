tls {
  http                   = true
  rpc                    = true
  ca_file                = "${data_dir}/agent-certs/ca.crt"
  cert_file              = "${data_dir}/agent-certs/agent.crt"
  key_file               = "${data_dir}/agent-certs/agent.key"
  verify_server_hostname = true
  verify_https_client    = true
}