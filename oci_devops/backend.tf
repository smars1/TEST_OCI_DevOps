terraform {
  backend "oci" {
    bucket         = "terraform-state-bucket"
    namespace      = "###########"   # namespace: desde OCI Storage
    region         = "us-phoenix-1"   # Ajusta segun tu region
    key            = "terraform.tfstate"  # Nombre del archivo state
    auth           = "InstancePrincipal"  # O usa API Key si ejecutas localmente
  }
}
