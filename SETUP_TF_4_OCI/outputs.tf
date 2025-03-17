output "UserTenancyName" {
  value = [data.oci_identity_tenancy.UserTenancy.name]
}

output "UserTenancyRegion" {
  value = [data.oci_identity_tenancy.UserTenancy.home_region_key]
}

output "UserTenancyDescription" {
  value = [data.oci_identity_tenancy.UserTenancy.description]
}
