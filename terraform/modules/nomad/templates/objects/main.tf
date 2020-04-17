variable "metas" {
  type = "string"
  description = "describe your variable"
  default = <<EOH
meta {}
EOH
}
variable "constraints" {
  type = "string"
  description = "describe your variable"
  default = "constraint {}"
}
variable "volumes" {
  type = "string"
  description = "describe your variable"
  default = ""
}
variable "tasks" {
  type = "string"
  description = "describe your variable"
  default = ""
}
data "template_file" "metas" {
  template = <<EOH
${var.metas}
EOH
  
}
data "template_file" "constraints" {
  template = <<EOH
${var.constraints}
EOH
}


data "template_file" "volumes" {
  template = <<EOH
${var.volumes}
EOH
}

data "template_file" "tasks" {
  template = <<EOH
$${tasks}
EOH
  vars = {
    tasks = var.tasks
  }
}

data "template_file" "nomad_group" { 
  template = "${file("${path.module}/../statefull_group.tf")}"
  vars = {
    group_name = "State"
    count = 1
    restart_mode = "delay"
    migrate = true
    sticky = true
    ephemeral_size = 100
    metas = data.template_file.metas.rendered
    constraints = data.template_file.constraints.rendered
    volumes = data.template_file.volumes.rendered
    tasks = data.template_file.tasks.rendered
  }
}
