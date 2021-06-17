## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


resource "oci_database_autonomous_database" "test_autonomous_database" {
  #Required
  admin_password           = var.autonomous_database_admin_password
  compartment_id           = var.compartment_ocid
  cpu_core_count           = var.autonomous_database_cpu_core_count
  data_storage_size_in_tbs = var.autonomous_database_data_storage_size_in_tbs
  db_name                  = var.autonomous_database_db_name
  db_version               = var.autonomous_database_db_version
  data_safe_status         = var.autonomous_database_data_safe_status
  db_workload              = var.autonomous_database_db_workload
  display_name             = var.autonomous_database_display_name
  is_auto_scaling_enabled  = var.autonomous_database_is_auto_scaling_enabled
  license_model            = var.autonomous_database_license_model
  # whitelisted_ips = var.autonomous_database_whitelisted_ips
  count = var.adw_enabled == true ? 1 : 0

}

resource "random_string" "autonomous_data_warehouse_wallet_password" {
  length  = 16
  special = true
}

resource "oci_database_autonomous_database_wallet" "autonomous_data_warehouse_wallet" {
  autonomous_database_id = oci_database_autonomous_database.test_autonomous_database[0].id
  password               = random_string.autonomous_data_warehouse_wallet_password.result
  base64_encode_content  = "true"
}

resource "local_file" "autonomous_data_warehouse_wallet_file" {
  content_base64 = oci_database_autonomous_database_wallet.autonomous_data_warehouse_wallet.content
  filename       = "${var.walletPath}${var.walletName}"
}


