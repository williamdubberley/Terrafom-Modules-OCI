#*************************************
#           TF Requirements
#*************************************
variable "tenancy_ocid" {
  default = ""
}
variable "region" {
  default = ""
}
variable "user_ocid" {
  default = ""
}
variable "private_key_path" {
  default = ""
}
variable "fingerprint" {
  default = ""
}
variable "compartment_ocid" {
  default = ""
}

#*************************************
#        Local Variables
#*************************************
variable "ssh_public_key" {}
variable "ssh_private_key" {}
variable "adw_enabled" {
  description = "whether to create RJ server"
  default     = true
  type        = bool
}
variable "rj_enabled" {
  description = "whether to create RJ server"
  default     = true
  type        = bool
}
variable "rj_instance_name" {
  description = "instance name and dns hostname of the RJ server"
  default     = "rjserver"
  type        = string
}
variable "rj_shape" {
  description = "Compute Shape"
  default     = "VM.Standard2.4"
  type        = string
}
variable "rj_type" {
  description = "Compute Shape"
  default     = "Relational Junction Standard"
  type        = string
}

variable "timeout" {
  description = "Timeout setting for resource creation "
  default     = "20m"
}
variable "compute_instance_user" {
  description = "Login user for application instance"
  default     = "opc"
}

variable "ad_number" {
  default     = 1
  description = "Which availability domain to deploy to depending on quota, zero based."
}


variable "tags" {
  description = "simple key-value pairs to tag the resources created"
  type        = map(any)
  default = {
    environment = "poc"
  }
}

#*************************************
#           Data Sources
#*************************************

data "oci_identity_tenancy" "tenant_details" {
  #Required
  tenancy_id = var.tenancy_ocid
}
data "oci_identity_regions" "home-region" {
  filter {
    name   = "key"
    values = [data.oci_identity_tenancy.tenant_details.home_region_key]
  }
}
data "oci_identity_regions" "current_region" {
  filter {
    name   = "name"
    values = [var.region]
  }
}
data "oci_identity_compartment" "current_compartment" {
  #Required
  id = var.compartment_ocid
}

variable "ad_name" {
  default = ""
}
variable "subnet_id" {
  default = ""
}
variable "walletPath" {
  default = ""
}
variable "walletName" {
  default = ""
}
variable "createKey" {
  description = "whether to create RJ server"
  default     = true
  type        = bool
}
variable "dbname" {
  default = ""
}