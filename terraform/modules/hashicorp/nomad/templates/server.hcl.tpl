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


