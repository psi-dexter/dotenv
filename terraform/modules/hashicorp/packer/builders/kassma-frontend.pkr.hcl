source "docker" "example" {
  image   = "amd64/node:12"
  discard = true
  volumes = {
    "/opt/paykassma/paykassma-payment-frame" = "/srv/www/plugin"
    "/opt/paykassma/paykassma-frontend"      = "/srv/www/frontend"
  }
}


build {
  sources = ["source.docker.example"]
  provisioner "shell" {
    inline = ["cd /srv/www/frontend && mv .env.example .env && yarn && yarn run build"]
  }
  provisioner "shell" {
    inline = ["cd /srv/www/plugin && mv .env.example .env && yarn && yarn run build"]
  }
  post-processor "shell-local" {
    inline = ["zip -r /opt/packages/frontend.zip /opt/paykassma/paykassma-frontend /opt/paykassma/paykassma-payment-frame"]
  }
}
