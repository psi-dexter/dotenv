bind_addr = "0.0.0.0"
data_dir = "${data_dir}"
datacenter = "${datacenter}"
region = "global"
name = "${node_name}"

ports {
  http = 5656
  rpc  = 5657
  serf = 5658
}
client {
  enabled = true
  servers = ["${nomad_server}:4647"]
  network_speed = 10000
  max_kill_timeout = "90s"
  options {
    "driver.raw_exec.enable" = "1"
  }
}
