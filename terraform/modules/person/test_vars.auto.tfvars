person_dexter = {
  Name = "Dexter1"
  Age  = 36
}
money_bascket = {
  Name = "rent"
  payment = {
    type                  = "recurent"
    currency              = "RUB:CASH"
    amount                = 55000
    cycle_hours           = 740
    convert_latency_hours = 48
  }
  priority = 0
  items    = [""]
  persons  = ["person_dexter"]
  type     = "subscription"
  deadline = "12.01.2021"
  account = {
    address        = "3Apk5dDqtoEvQ3A631eMFzaYsffrGb97dY"
    defenition_uri = ""
    POS_url        = "https://pay.infowaste.xyz/apps/2iGXG8rg1zgQTmMV2x2eC76eZBB/pos"
    #currency = "RUB"
  }
}
