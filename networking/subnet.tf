resource "oci_core_subnet" "rj-public-subnet" {
  count = var.rj_vcn_use_existing ? 0 : 1
  #Required
  cidr_block     = var.rj_subnet_public_cidr
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.rj-vcn[0].id
  display_name   = var.rj_subnet_public_displayname

  # Public Subnet
  prohibit_public_ip_on_vnic = false
  dns_label                  = var.rj_pub_subnet_dns_label
  route_table_id             = oci_core_route_table.rj-public-rt[0].id
  security_list_ids          = [oci_core_security_list.rj-public-sl[0].id]
}

resource "oci_core_subnet" "rj-private-subnet" {
  count = var.rj_vcn_use_existing ? 0 : 1
  #Required
  cidr_block     = var.rj_subnet_private_cidr
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.rj-vcn[0].id
  display_name   = var.rj_subnet_private_displayname

  # Private Subnet
  prohibit_public_ip_on_vnic = true
  dns_label                  = var.rj_pvt_subnet_dns_label
  route_table_id             = oci_core_route_table.rj-private-rt[0].id
  security_list_ids          = [oci_core_security_list.rj-private-sl[0].id]
}