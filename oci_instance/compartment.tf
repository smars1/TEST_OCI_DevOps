resource "oci_identity_compartment" "Test-Terraform-Lab" {
    provider = oci.homeregion
    name = "Test-Terraform-Lab"
    description = "Terraform laboratory compartment"
    compartment_id = var.compartment_ocid
    
    provisioner "local-exec" {
        command = "sleep 60" 
    }
}
