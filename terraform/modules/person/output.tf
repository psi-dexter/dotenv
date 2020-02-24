output "money_bascket_info" {
  value = (local.money_bascket)
}
output "hour_payment" {
  value = (local.money_bascket.payment.amount)/(local.money_bascket.payment.cycle_hours - local.money_bascket.payment.convert_latency_hours)
}
