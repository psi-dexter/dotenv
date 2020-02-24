variable person_dexter {
  type = object({
    Name = string
    Age  = number
  })
  default = {
    Name = "dexter"
    Age  = 35
  }
}


locals {
  per = var.person_dexter
}
output "person_dexter" {
  value = var.person_dexter["Name"]
}
output "test_locals" {
  value = local.per.Name
}
