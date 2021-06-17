resource "oci_core_route_table" "rj-public-rt" {
  count = var.rj_vcn_use_existing ? 0 : 1
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.rj-vcn[0].id
  display_name   = var.rj_pub_rt_displayname

  // Internet Gateway
  route_rules {
    #Required
    network_entity_id = oci_core_internet_gateway.rj-internet-gateway[0].id

    #Optional
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }

}

resource "oci_core_route_table" "rj-private-rt" {
  count = var.rj_vcn_use_existing ? 0 : 1
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.rj-vcn[0].id
  display_name   = var.rj_pvt_rt_displayname

  // NAT Gateway
  route_rules {
    #Required
    network_entity_id = oci_core_nat_gateway.rj-nat-gateway[0].id

    #Optional
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }

}