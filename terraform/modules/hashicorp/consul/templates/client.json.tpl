{
    "log_level": "INFO",
    "server": false,
    "datacenter":"${datacenter}",
	"node_name":"${node_name}",
    "ports": {
	        "https": 8501,
	        "grpc": 8502
	    },
    "ui": true,
    "data_dir": "/local/data",
    "recursors":["10.8.0.1"],
    "retry_join": ["server.${datacenter}.consul"],
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
    "key_file": "${key_file}",
    "auto_encrypt": {
      "tls": true
    }
  }
  