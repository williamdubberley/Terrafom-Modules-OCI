resource "oci_core_nat_gateway" "rj-nat-gateway" {
  count = var.rj_vcn_use_existing ? 0 : 1
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.rj-vcn[0].id

  #Optional
  display_name = var.rj_nat_displayname
}
