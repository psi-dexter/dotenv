variable "l2tp_ipv4" {
  type = string
}
variable "pre_shared_key" {
  type = string
}
variable "user" {
  type = string
}
variable "name" {
  type        = string
  description = "describe your variable"
  default     = "default_vpn"
}
variable "password" {
  type = string
}
