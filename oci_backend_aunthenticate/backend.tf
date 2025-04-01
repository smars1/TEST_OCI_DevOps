terraform {
    backend "s3" {
        bucket   = "terraform"
        key      = "[project]/terraform.tfstate"
        region   = "us-ashburn-1"
        endpoint = "[endpointurl]"
        skip_region_validation      = true
        skip_credentials_validation = true
        skip_metadata_api_check     = true
        force_path_style            = true
        workspace_key_prefix = "[project]_workspaces"
    }
}

# this requires `terraform init -backend-config="access_key=[customersecretid]" -backend-config="secret_key=[customersecretvalue]"` to be run to init the backend. A one off config