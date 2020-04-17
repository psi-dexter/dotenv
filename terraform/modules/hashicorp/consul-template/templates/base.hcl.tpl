
vault {
  # This is the address of the Vault leader. The protocol (http(s)) portion
  # of the address is required.
  address = "https://vault.infowaste.xyz:8200"

  # This value can also be specified via the environment variable VAULT_TOKEN.
  token = "${token}"


  # This tells Consul Template that the provided token is actually a wrapped
  # token that should be unwrapped using Vault's cubbyhole response wrapping
  # before being used. Please see Vault's cubbyhole response wrapping
  # documentation for more information.
  unwrap_token = false

  # This option tells Consul Template to automatically renew the Vault token
  # given. If you are unfamiliar with Vault's architecture, Vault requires
  # tokens be renewed at some regular interval or they will be revoked. Consul
  # Template will automatically renew the token at half the lease duration of
  # the token. The default value is true, but this option can be disabled if
  # you want to renew the Vault token using an out-of-band process.
  renew_token = true
}

# This block defines the configuration for connecting to a syslog server for
# logging.
syslog {
  enabled = true

  # This is the name of the syslog facility to log to.
  facility = "LOCAL5"
}
