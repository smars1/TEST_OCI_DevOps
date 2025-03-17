- why is need it to write the terraform version, and how to make this config ?

## Define terraform variables
``variables.tf`` file in this file we can to write all the variables that we need its 

example: 

```sh
variable "tenancy_ocid" {
  description = "The OCID (Oracle Cloud Identifier) of the tenancy where resources will be created."
}
```


You can also create variables in a similar manner; however, you’ll need to replace the extension `.tf` with `.sh` (``tf_vars.sh``) and modify the code accordingly.

Additionally, it’s crucial to understand that when creating variables this way, each variable must begin with the prefix `TF_VAR_`. This prefix allows Terraform to recognize the variables correctly.

```sh
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..*******"
```

## provider

In the ``provider.tf`` file you can define a service provider this provider defines the cloud environment where work us.

For example, we can choose OCI as provider and working and begind to build infrastructure but to beging to build the firts step is choose OCI as provider 

```sh
provider "oci" {
  tenancy_ocid = "<tenancy-ocid>"
  user_ocid = "<user-ocid>" 
  private_key_path = "<rsa-private-key-path>"
  fingerprint = "<fingerprint>"
  region = "<region-identifier>"
}
```

if you has been to define variables, could be to able to call it`s the next way:

To call a variable defined you need add the method ``var.`` like prefix and then write the variable name target.

for example if you want to call the tenancy_ocid variable you can do it write ``var.tenancy_ocid`` like show the following code example:

```sh
provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid = var.user-ocid
  private_key_path = var.rsa-private-key-path
  fingerprint = var.fingerprint
  region = var.region-identifier
}
```
For the other variables that you define the process will be the same

## Resources


```sh
resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = var.tenancy_ocid
    description = "Compartment for Terraform resources."
    name = "Terraform-Compartment_Test"
}
```