terraform {
  required_providers {
    tanzu-mission-control = {
      source = "vmware/tanzu-mission-control"
      version = "1.2.3"
    }
  }
}

provider "tanzu-mission-control" {
  endpoint = var.endpoint
  vmw_cloud_api_token = var.vmw_cloud_api_token
}


# Create Tanzu Mission Control cluster group
resource "tanzu-mission-control_cluster_group" "create_cluster_group" {
  name = var.group_name
  meta {
    description = var.group_description
    labels = {
      "createdBy" : "Aria",
      "Owner" : "APA"
    }
  }
}
