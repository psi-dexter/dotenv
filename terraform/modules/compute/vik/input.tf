
variable "ipv4_wan" {
}
variable "ipv4_local" {
  type = string
}
variable "host_name" {
  type = string
}
variable "datacenter" {
  type = string
}
variable "os" {
  type = string
}

variable "consul_version" {
  type = string
}
variable "nomad_version" {
  type = string
}
variable host_keyfile {
  default = "~/.ssh/vik"
}
