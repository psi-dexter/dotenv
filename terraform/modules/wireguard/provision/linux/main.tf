
resource "null_resource" "instnce_wireguard" {
  connection {
    host        = var.host
    type        = "ssh"
    user        = "root"
    private_key = file(var.host_keyfile)
  }
  provisioner "file" {
    content     = file("./modules/wireguard/templates/install.sh")
    destination = "/tmp/wireguard_install.sh"
  }
  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    inline = [
      "chmod +x /tmp/wireguard_install.sh",
      "/tmp/wireguard_install.sh"

    ]
  }
}
