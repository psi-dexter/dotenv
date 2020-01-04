variable person {
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
  per = var.person
}
output "test_1" {
  value = var.person["Name"]
}
output "test_locals" {
  value = local.per.Name
}
