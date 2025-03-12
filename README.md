# TEST_OCI_DevOps


## Terraform providers
Terraform provider is a plugin responsible for managing API integrations and exposing cloud resources for automation.

Some sevice that Terraform support in ``IasS``

- IaaS: OCI, AWS, GCP, Azure, OpenStack 



## Terraform variables

Terraform variables allow to parameterize your configurations, making more dinamic and flexible. 
Varable declarations are typically placed in a file named variables.tf.

#### Variable delaclaration example:
Declare a vatiable vcn_cidr with a type string and default value.
```sh
variable "vcn_cidr" {
  type = "string"
  default     = "10.0.0.0/16"
}
```

#### Using variables:

Uses the variable in a resource configuration by referencing `var.<name>`
```sh
resource
"oci_core_virtual_network"
"MyVCN"{
cidr_block = var.vcn_cidr
(...)
}
```

#### Input Values
Pass values dynamically during the Terraform run using the -var flag.
```sh
terraform apply - 
var="vcn_cidr"=192.168.0.0/16"
```