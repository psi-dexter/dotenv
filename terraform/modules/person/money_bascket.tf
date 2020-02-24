variable money_bascket {
  type = object({
    Name = string
    payment = object({
      type                  = string
      currency              = string
      amount                = number
      cycle_hours           = number
      convert_latency_hours = number
    })
    priority = number
    items    = list(any)
    persons  = list(string)
    deadline = string
    account = object({
      address        = string
      defenition_uri = string
      POS_url        = string
      #currency = "RUB"
    })
  })
  default = {
    Name = "rent"
    payment = {
      type                  = "recurent"
      currency              = "name:type"
      amount                = 100
      cycle_hours           = 740
      convert_latency_hours = 48
    }
    priority = 0
    items    = [""]
    persons  = [""]
    type     = "subscription"
    deadline = "12.01.2021"
    account = {
      address        = ""
      defenition_uri = ""
      POS_url        = ""
      #currency = "RUB"
    }
  }
}

locals {
  money_bascket = var.money_bascket
  rent_users    = [local.per]
}
locals {
  #local.money_bascket.persons = tolist(["${data.template_file.bootstrap.rendered}"])

  #local.money_bascket.persons = ["sfswfw",""]
}
data "template_file" "rent_users" {
  template = <<-EOT
 %{for user in local.rent_users} $user,%{endfor}
EOT

}

