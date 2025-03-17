output "compartment_id" {
    value = oci_identity_compartment.tf-compartment.id
    description = "Show the resource compartment id"
  
}

output "compartment_name"{
    value = oci_identity_compartment.tf-compartment.name
    description = "Show the resource compartment name"
}