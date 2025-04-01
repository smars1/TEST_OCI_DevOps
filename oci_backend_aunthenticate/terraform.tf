provider "oci" {
    auth = "ResourcePrincipal"
    region = (terraform.workspace == "PROD") ? "us-ashburn-1" : "us-phoenix-1"
}
         

module "template_files" {
    source = "hashicorp/dir/template"
    base_dir = "${path.module}/src"
}
    
data "oci_objectstorage_namespace" "os_namespace" {
}

resource "oci_objectstorage_object" "objects" {
    for_each = module.template_files.files
    namespace = data.oci_objectstorage_namespace.os_namespace.namespace
    bucket = "[bucket_name]"
    object = each.key
    content_type = each.value.content_type
    source = abspath(each.value.source_path)
}