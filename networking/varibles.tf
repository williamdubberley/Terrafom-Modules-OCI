# Variables

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
#         Network Specific
#*************************************

variable "rj_vcn_name" {
  default = "Relational Junction VCN"
}
variable "rj_subnet_public_displayname" {
  default = "Relational Junction - Public"
}
variable "rj_subnet_public_cidr" {
  default = "10.0.0.0/24"
}
variable "rj_subnet_private_displayname" {
  default = "Data Science - Private"
}
variable "rj_subnet_private_cidr" {
  default = "10.0.1.0/24"
}
variable "rj_vcn_use_existing" {
  default = false
}
variable "rj_vcn_existing" {
  default = ""
}
variable "rj_subnet_public_existing" {
  default = ""
}
variable "rj_subnet_private_existing" {
  default = ""
}
variable "rj_pub_subnet_dns_label" {
  default = ""
}
variable "rj_pvt_subnet_dns_label" {
  default = ""
} 
variable "rj_IGW_displayname" {
  default = ""
}
variable "rj_vcn_cider_block" {
  default = "10.0.0.0/16"
}
variable "rj_pvt_sl_displayname" {
  default = ""
}
variable "rj_pub_sl_displayname" {
  default = ""
}
variable "rj_pvt_rt_displayname" {
  default = ""
}
variable "rj_pub_rt_displayname" {
  default = ""
}
variable "rj_vcn_dns_label" {
  default = ""
}
variable "rj_VCN_displayname" {
  default = ""
}
variable "rj_nat_displayname" {
  default = ""
}

