variable "os" {
  type        = string
  description = "linux or darwin"
  default     = "linux"
}
variable "config_dir" {
  type        = string
  description = "linux or darwin"
  default     = "/etc/vault.d"
}
variable "tls_dir" {
  type        = string
  description = "linux or darwin"
  default     = ""
}
variable "datacenter" {
  type        = string
  description = "describe your variable"
}
variable "is_server" {

}

variable "ipv4_local" {
  type = string
  #default = "10.8.0.1"
}
variable "host_name" {
  type = string
  #default = "vik"
}
