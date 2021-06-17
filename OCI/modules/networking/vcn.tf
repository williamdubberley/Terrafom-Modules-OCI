resource "oci_core_vcn" "rj-vcn" {
  count          = var.rj_vcn_use_existing ? 0 : 1
  cidr_block     = var.rj_vcn_cider_block
  compartment_id = var.compartment_ocid
  display_name   = var.rj_VCN_displayname
  dns_label      = var.rj_vcn_dns_label
}