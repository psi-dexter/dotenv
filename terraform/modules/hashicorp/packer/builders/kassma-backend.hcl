source "docker" "example" {
  image   = "composer"
  discard = true
  volumes = {
    "/opt/paykassma/paykassma-backend" = "/srv/www/app"
  }
}


build {
  sources = ["source.docker.example"]
  provisioner "shell" {
    inline = ["composer install -d /srv/www/app --ignore-platform-reqs"]
  }
  post-processor "shell-local" {
    inline = ["zip -r /opt/packages/backend.zip /opt/paykassma/paykassma-backend"]
  }
}
