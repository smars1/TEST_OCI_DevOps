data "oci_identity_tenancy" "UserTenancy" {
    tenancy_id = var.tenancy_ocid
}
