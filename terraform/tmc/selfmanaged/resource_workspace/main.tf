provider "tanzu-mission-control" {
  endpoint = var.endpoint # optionally use TMC_ENDPOINT env var
  insecure_allow_unverified_ssl = var.insecure_allow_unverified_ssl 

  self_managed {
    oidc_issuer = var.oidc_issuer # optionally use OIDC_ISSUER env var,
    username    = var.username    # optionally use TMC_SM_USERNAME env var
    password    = var.password    # optionally use TMC_SM_PASSWORD env var
  }
  //ca_file = var.ca_file # Path to Host's root ca set. The certificates issued by the issuer should be trusted by the host accessing TMC Self-Managed via TMC terraform provider.
}


resource "tanzu-mission-control_workspace" "create_workspace" {
  name = var.workspace_name

  meta {
    description = var.workspace_description
    labels = {
      "key1" : "value1"
      "key2" : "value2"
    }
  }
}
