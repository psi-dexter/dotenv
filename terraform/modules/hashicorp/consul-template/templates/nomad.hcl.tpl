template {
  source      = "/opt/nomad/templates/cl.agent.crt.tpl"
  destination = "/opt/nomad/agent-certs/cl.agent.crt"
  perms       = 0700
  command     = "systemctl status consul"
}

template {
  source      = "/opt/nomad/templates/cl.agent.key.tpl"
  destination = "/opt/nomad/agent-certs/cl.agent.key"
  perms       = 0700
  command     = "systemctl status consul"
}
template {
  source      = "/opt/nomad/templates/agent.crt.tpl"
  destination = "/opt/nomad/agent-certs/agent.crt"
  perms       = 0700
  command     = "systemctl status consul"
}

template {
  source      = "/opt/nomad/templates/agent.key.tpl"
  destination = "/opt/nomad/agent-certs/agent.key"
  perms       = 0700
  command     = "systemctl status consul"
}

template {
  source      = "/opt/nomad/templates/ca.crt.tpl"
  destination = "/opt/nomad/agent-certs/ca.crt"
  command     = "systemctl status consul"
}

# The following template stanzas are for the CLI certs

template {
  source      = "/opt/nomad/templates/cli.crt.tpl"
  destination = "/opt/nomad/cli-certs/cli.crt"
}

template {
  source      = "/opt/nomad/templates/cli.key.tpl"
  destination = "/opt/nomad/cli-certs/cli.key"
}
