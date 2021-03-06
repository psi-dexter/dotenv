  {
  "log_level": "INFO",
  "server": false,
  "bind_addr":"${advertise_ipv4}",
  "advertise_addr":"${advertise_ipv4}",
  "datacenter":"${datacenter}",
  "node_name":"${node_name}",
  "addresses":{
    "http":"${advertise_ipv4}"
  },
  "ports": {
    "dns": ${dns},
    "http": ${http},
    "https": ${https},
    "grpc": ${grpc},
    "serf_lan": ${serf_lan},
    "serf_wan": ${serf_wan}
  },

  "ui_config": {
    "enabled": true
  },
  "data_dir": "/var/consul/agent/data",
  "recursors":["1.1.1.1","8.8.8.8"],
  "retry_join": ["server.${datacenter}.consul:8301"],
  "connect": {
    "enabled" : true
  },
    "acl": {
    "enabled": true,
    "default_policy": "deny",
    "enable_token_persistence": true,
    "tokens": {
      "default":"${token}"
    }
  },
  "verify_incoming": false,
  "verify_outgoing": false,
  "verify_server_hostname": true,
  "ca_file": "${ca_file}",
  "cert_file": "${cert_file}",
  "key_file": "${key_file}"
}
  