# Variables
variable "adw_enabled" {
  description = "whether to create ADW server"
  default     = false
  type        = bool
}

variable "autonomous_database_cpu_core_count" {
  default = "1"
}

variable "autonomous_database_admin_password" {
}

variable "autonomous_database_db_name" {
  default = "ADWDB"
}

variable "autonomous_database_display_name" {
  default = "My ADW DB"
}

variable "autonomous_database_db_version" {
  default = "19c"
}

variable "autonomous_database_is_auto_scaling_enabled" {
  default = "false"
}

variable "autonomous_database_data_storage_size_in_tbs" {
  default = "1"
}

variable "autonomous_database_db_workload" {
  default = "DW"
}

variable "autonomous_database_license_model" {
  default = "BRING_YOUR_OWN_LICENSE"
}

variable "autonomous_database_data_safe_status" {
  default = "NOT_REGISTERED"
}

variable "compartment_ocid" {
  default = ""
}

variable "walletPath" {
  default = ""
}
variable "walletName" {
  default = ""
}

