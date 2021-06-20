variable "compartment_ocid" {
  default = ""
}
variable "oac_enabled" {
  default = ""
}
variable "oac_name" {
  type        = string
  description = "provide value of OAC Name"
}
variable "oac_description" {
  type        = string
  description = "provide value of OAC Description"
}

variable "oac_capacity_type" {
  type        = string
  description = "provide value of OAC Capacity Type"
}

variable "oac_capacity_value" {
  type        = string
  description = "provide value of OAC Capacity Value"
}


variable "oac_feature_set" {
  type        = string
  description = "provide value of OAC Feature set"
}

variable "oac_license_type" {
  type        = string
  description = "provide value of OAC Licence Type"
}

variable "oac_idcs_token" {
  type        = string
  description = "provide value of OAC IDCS Token"
}