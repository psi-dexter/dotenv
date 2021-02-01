listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = true
}
storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
  token   = "d6679acc-afb9-489b-bdd4-a1c1b70101c6"
}
ui = true
