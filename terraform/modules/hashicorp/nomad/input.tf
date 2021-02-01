variable "os" {
  type        = string
  description = "linux or darwin"
  default     = "linux"
}
variable "datacenter" {
  type    = string
  default = "dc1"
}
variable "node_name" {
  type        = string
  description = "describe your variable"
}
variable "ipv4_local" {
  type        = string
  description = "describe your variable"
}
variable "ipv4_wan" {
  type        = string
  description = "describe your variable"
  default     = "0.0.0.0"
}

variable "host_keyfile" {
  default = "~/.ssh/vik"
}

variable "data_dir" {
  type        = string
  description = "describe your variable"
  default     = "/var/nomad"
}
