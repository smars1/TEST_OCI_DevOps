terraform {
  backend "oci" {
    bucket    = "terraform-state-bucket"
    namespace = "tu-namespace"
    region    = "us-phoenix-1"
    key       = "terraform.tfstate"
    auth      = "InstancePrincipal"
  }
}
