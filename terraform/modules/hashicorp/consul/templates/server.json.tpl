{
  "log_level": "INFO",
  "server": true,
  "bind_addr":"${advertise_ipv4}",
  "advertise_addr":"${advertise_ipv4}",
  "datacenter":"${datacenter}",
  "node_name":"${node_name}",
  "bootstrap_expect":1,
  "addresses":{
    "http":"${advertise_ipv4}"
  },
  "ports": {
    "dns": 53,
    "http": 8500,
    "https": -1,
    "grpc": 8502,
    "serf_lan": 8301,
    "serf_wan": 8302,
    "server":8300
  },
  "ui_config": {
    "enabled": true
  },
  "data_dir": "/var/consul/server/data",
  "recursors":["1.1.1.1","8.8.8.8"],
  "telemetry": { 
      "disable_compat_1.9" : true,
      "prometheus_retention_time": "60s"
  },
  "acl": {
    "enabled": true,
    "default_policy": "deny",
    "enable_token_persistence": true,
    "tokens": {
      "master":"master_token",
      "default":"${token}"
    }
  },
  "primary_datacenter":"dc1",
  "verify_incoming": false,
  "verify_outgoing": false,
  "verify_server_hostname": true,
  "ca_file": "${ca_file}",
  "cert_file": "${cert_file}",
  "key_file": "${key_file}"
}
