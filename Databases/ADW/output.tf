output "autonomous_data_warehouse_wallet_password" {
  value = random_string.autonomous_data_warehouse_wallet_password.result
}
output "autonomous_data_warehouse_wallet_Location" {
  value = local_file.autonomous_data_warehouse_wallet_file.filename
}