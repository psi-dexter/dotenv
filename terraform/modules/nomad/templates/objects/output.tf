output "nomad_group" {
  value = data.template_file.nomad_group.rendered
}