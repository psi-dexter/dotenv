variable "os" {
  type        = string
  description = "linux or darwin"
}
variable "datacenter" {
  type = string
}
variable "host_name" {
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
}

variable host_keyfile {
  default = "~/.ssh/vik"
}

variable "data_dir" {
  type        = string
  description = "describe your variable"
  default     = "/opt/nomad"
}
