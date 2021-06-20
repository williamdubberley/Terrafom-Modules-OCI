resource "oci_analytics_analytics_instance" "analytics_instance" {
  #Required
  count = var.oac_enabled == true ? 1 : 0
  capacity {
    #Required
    capacity_type  = var.oac_capacity_type
    capacity_value = var.oac_capacity_value
  }
  compartment_id = var.compartment_ocid
  feature_set    = var.oac_feature_set
  license_type   = var.oac_license_type
  name           = var.oac_name

  #Optional
  description       = var.oac_description
  idcs_access_token = var.oac_idcs_token
  # network_endpoint_details {
  #Required
  # network_endpoint_type = "${var.analytics_instance_network_endpoint_details_network_endpoint_type}"
  #Optional
  #  subnet_id = "${oci_core_subnet.test_subnet.id}"
  #  vcn_id = "${oci_core_vcn.test_vcn.id}"
  #  whitelisted_ips = "${var.analytics_instance_network_endpoint_details_whitelisted_ips}"
  #  whitelisted_vcns {

  #Optional
  #     id = "${var.analytics_instance_network_endpoint_details_whitelisted_vcns_id}"
  #      whitelisted_ips = "${var.analytics_instance_network_endpoint_details_whitelisted_vcns_whitelisted_ips}"
  #   }
  # }
}

output "OAC_URL" {
  description = "url to connect to"
  value       = var.oac_enabled ? oci_analytics_analytics_instance.analytics_instance[0].service_url : null
}
