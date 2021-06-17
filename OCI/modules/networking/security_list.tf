resource "oci_core_security_list" "rj-public-sl" {
  count = var.rj_vcn_use_existing ? 0 : 1
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.rj-vcn[0].id
  display_name   = var.rj_pub_sl_displayname
  # Egress - Allow All
  egress_security_rules {
    destination      = "0.0.0.0/0"
    protocol         = "All"
    stateless        = false
    destination_type = "CIDR_BLOCK"

  }

  # Ingress - Allow SSH
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      max = 22
      min = 22
    }

  }
 # Ingress - Allow SSH
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    description = "Admin UI for Relational Junction "
    tcp_options {
      max = 8080
      min = 8080
    }

  }
}


resource "oci_core_security_list" "rj-private-sl" {
  count = var.rj_vcn_use_existing ? 0 : 1
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.rj-vcn[0].id
  display_name   = var.rj_pvt_sl_displayname
  # Egress - Allow All
  egress_security_rules {
    destination      = "0.0.0.0/0"
    protocol         = "All"
    stateless        = false
    destination_type = "CIDR_BLOCK"
  }
  # Ingress - Allow All
  ingress_security_rules {
    #Required
    protocol    = "All"
    source      = var.rj_vcn_cider_block
    source_type = "CIDR_BLOCK"
    stateless   = false
  }

}