{
  "ports": {
    "grpc": 8502
  },
  "connect": {
     "enabled": true
     ca_provider = "consul"
     private_key ="/etc/consul.d/tls/consul-agent-ca-key.pem"
     root_cert = "/etc/consul.d/tls/consul-agent-ca.pem"
  }
}