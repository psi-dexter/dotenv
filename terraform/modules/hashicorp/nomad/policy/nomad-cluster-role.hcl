
resource "vault_token_auth_backend_role" "nomad-cluster" {
  role_name           = "nomad-cluster"
  allowed_policies    = []
  disallowed_policies = ["nomad-server"]
  orphan              = true
  period              = "259200"
  renewable           = true
  explicit_max_ttl    = "0"
}
