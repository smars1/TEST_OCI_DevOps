# VCN
resource "oci_core_virtual_network" "TestTerrafomrLabVNC" {
    cidr_block =   var.VCN-CIDR
    dns_label = "TestTerraformLabVCN"
    compartment_id = oci_identity_compartment.Test-Terraform-Lab.id
    display_name = "TestTerrafomrLabVNC"
}

# DHCP
resource "oci_core_dhcp_options" "TestTerrafomrLabDhcpOptions1" {
    compartment_id = oci_identity_compartment.Test-Terraform-Lab.id
    vcn_id = oci_core_virtual_network.TestTerrafomrLabVNC.id
    display_name =  "TestTerrafomrLabDhcpOptions1"

    options {
      type = "DomainNameServer"
      server_type = "VcnLocalPlusInternet"
    }

    options {
      type = "SearchDomain"
      search_domain_names = ["Test_oci_terrraform_labs.com"]
    }

}


# internet gateway
resource "oci_core_internet_gateway" "TestTerrafomGateway" {
    compartment_id = oci_identity_compartment.Test-Terraform-Lab.id
    display_name = "TestTerraformGateway"
    vcn_id = oci_core_virtual_network.TestTerrafomrLabVNC.id
  
}


# Route table
resource "oci_core_route_table" "TestTerrafomRouteTable" {
    compartment_id = oci_identity_compartment.Test-Terraform-Lab.id
    vcn_id = oci_core_virtual_network.TestTerrafomrLabVNC.id
    display_name = "TestTerraformRouteTable"
    route_rules {
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      network_entity_id = oci_core_internet_gateway.TestTerrafomGateway.id
    }
  
}


# Security list
resource "oci_core_security_list" "TestTerraformLabSL" {
    compartment_id = oci_identity_compartment.Test-Terraform-Lab.id
    vcn_id = oci_core_virtual_network.TestTerrafomrLabVNC.id
    display_name = "TestTerraformLabSL"
    
    egress_security_rules {
      protocol = "6"
      destination = "0.0.0.0/0"
    }

    dynamic "ingress_security_rules" {
        for_each = var.service_ports
        content {
          protocol = "6"
          source = "0.0.0.0./0"
          tcp_options {
            max = ingress_security_rules.value
            min = ingress_security_rules.value
          }
        }
    }

    ingress_security_rules {
      protocol = "6"
      source = var.VCN-CIDR
    }

}


# Subnet
resource "oci_core_subnet" "TestTerraformWebSubnet"{
    cidr_block = var.Subnet-CIDR
    display_name = "TestTerraformWebSubnet"
    dns_label = "TestTerraformLabN1"
    compartment_id = oci_identity_compartment.Test-Terraform-Lab.id
    vcn_id = oci_core_virtual_network.TestTerrafomrLabVNC.id
    route_table_id = oci_core_route_table.TestTerrafomRouteTable.id
    dhcp_options_id = oci_core_dhcp_options.TestTerrafomrLabDhcpOptions1.id
    security_list_ids = [oci_core_security_list.TestTerraformLabSL.id]
}