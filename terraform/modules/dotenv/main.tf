variable user { default = "dexter" }


data "template_file" "bootstrap" {
  template = "${file("${path.module}/templates/bootstrap/bootstrap.sh.tpl")}"
  vars = {
    init      = "${file("${path.module}/templates/bootstrap/__init.sh.tpl")}"
    homebrew  = "${file("${path.module}/scripts/_homebrew.sh")}"
    hashicorp = "${file("${path.module}/scripts/hashicorp.sh")}"
  }
}
data "template_file" "user_env" {
  template = "${file("${path.module}/templates/bootstrap/user_env.sh.tpl")}"
  vars = {
    init     = "${file("${path.module}/templates/bootstrap/__init.sh.tpl")}"
    zsh      = "${file("${path.module}/scripts/zsh.sh")}"
    tor      = "${file("${path.module}/scripts/tor.sh")}"
    bitcoin  = "${file("${path.module}/scripts/bitcoin.sh")}"
    browsers = "${file("${path.module}/scripts/browsers.sh")}"

    virtualbox = "brew cask install virtualbox"
  }
}
resource "local_file" "bootstrap" {
  content         = data.template_file.bootstrap.rendered
  filename        = "/tmp/bootstrap.sh"
  file_permission = "0740"
}
resource "local_file" "user_env" {
  content         = data.template_file.bootstrap.rendered
  filename        = "/tmp/user_env.sh"
  file_permission = "0740"
}
resource "null_resource" "environment" {


  provisioner "local-exec" {
    command     = "/tmp/user_env.sh"
    interpreter = ["/bin/bash", "-c"]
  }
}



data "template_file" "zsh_rc" {
  template = "${file("${path.module}/templates/zsh_rc.tpl")}"
  vars = {
    aliases      = "${file("${path.module}/templates/zsh_aliases.tpl")}"
    powerlevel9k = "${file("${path.module}/templates/zsh_powerlevel9k.tpl")}"
  }
}
resource "local_file" "zsh_rc" {
  content         = data.template_file.zsh_rc.rendered
  filename        = "/Users/${var.user}/.zshrc"
  file_permission = "0740"
}
resource "local_file" "sublime_terminus" {
  content         = "${file("${path.module}/sublime/Terminus.sublime-settings")}"
  filename        = "/Users/${var.user}/Library/Application Support/Sublime Text 3/Packages/User/Terminus.sublime-settings"
  file_permission = "0640"
}

output "zsh_rc" {
  value = "${data.template_file.bootstrap.rendered}"
}
