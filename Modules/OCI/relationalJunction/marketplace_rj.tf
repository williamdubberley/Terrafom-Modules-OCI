# Licensed under the GNU AFFERO GENERAL PUBLIC LICENSE Version 3 https://www.gnu.org/licenses/agpl-3.0.txt

data "oci_marketplace_listing_package_agreements" "rj_listing_package_agreements" {
  #Required
  listing_id      = data.oci_marketplace_listing.rj_listing.id
  package_version = data.oci_marketplace_listing.rj_listing.default_package_version
  compartment_id  = var.compartment_ocid
}

data "oci_marketplace_listing_package" "rj_listing_package" {
  #Required
  listing_id      = data.oci_marketplace_listing.rj_listing.id
  package_version = data.oci_marketplace_listing.rj_listing.default_package_version
  compartment_id  = var.compartment_ocid
}

data "oci_marketplace_listing_packages" "rj_listing_packages" {
  #Required
  listing_id     = data.oci_marketplace_listing.rj_listing.id
  compartment_id = var.compartment_ocid
}

data "oci_marketplace_listing" "rj_listing" { 
  listing_id     = data.oci_marketplace_listings.rj_listings.listings.0.id
  compartment_id = var.compartment_ocid
}

data "oci_marketplace_listings" "rj_listings" {
  category       = ["Data Integration"]
  name           = [var.rj_type]
  compartment_id = var.compartment_ocid
}

/* do not need this - but leaving it here in case something changes...
data "oci_marketplace_publishers" "rj_publishers" {
  compartment_id = var.compartment_ocid
}

data "oci_marketplace_categories" "rj_categories" {
  filter {
    name   = "name"
    values = ["Relational Junction"]
  }
}*/

/* Now you need additional data sources for app catalog subscription creation */

data "oci_core_app_catalog_listing" "rj_app_catalog_listing" {
  listing_id = data.oci_marketplace_listing_package.rj_listing_package.app_catalog_listing_id
}

data "oci_core_app_catalog_listing_resource_versions" "rj_app_catalog_listing_resource_versions" {
  listing_id = data.oci_marketplace_listing_package.rj_listing_package.app_catalog_listing_id
}

data "oci_core_app_catalog_listing_resource_version" "rj_app_catalog_listing_resource_version" {
  listing_id       = data.oci_marketplace_listing_package.rj_listing_package.app_catalog_listing_id
  resource_version = data.oci_core_app_catalog_listing_resource_versions.rj_app_catalog_listing_resource_versions.app_catalog_listing_resource_versions[0].listing_resource_version
}
