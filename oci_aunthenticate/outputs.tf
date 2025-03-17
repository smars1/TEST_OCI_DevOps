# Output the "list" of all availability domains.
output "all-availability-domains-in-your-tenancy-oci" {
  value = data.oci_identity_availability_domains.example.availability_domains
}