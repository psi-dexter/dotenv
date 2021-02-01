variable "datacenter" {
  type    = string
  default = "dc1"
}
variable "port_shift" {
  default = 0
}
variable "advertise_ipv4" {
  type        = string
  description = "describe your variable"
}
variable "node_name" {
  type    = string
  default = "hostname1"
}
variable "token" {
  type        = string
  description = "describe your variable"
  default     = "default_value"
}
variable "ca_file" {
  type        = string
  description = "describe your variable"
  default     = "/etc/consul.d/tls/consul-agent-ca.pem"
}
variable "cert_file" {
  type        = string
  description = "describe your variable"
  default     = "/etc/consul.d/tls"
}
variable "key_file" {
  type        = string
  description = "describe your variable"
  default     = "/etc/consul.d/tls"
}
