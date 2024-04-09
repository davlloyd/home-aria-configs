

provider "tanzu-mission-control" {
  endpoint = var.endpoint
  vmw_cloud_api_token = var.vmw_cloud_api_token
}

# Create an EKS cluster via TzMC and add to a cluster group
resource "tanzu-mission-control_akscluster" "aria_aks_cluster" {
  credential_name = "lloydd-azure"
  subscription_id = "abd4dcff-b646-4ef2-9bd1-5d904339d860"
  resource_group  = "vmwtmc-c71b1610-2c2c4e66"
  name            = var.cluster_name
  meta {
    description = var.cluster_description
    labels      = { 
      "createdBy" : "Aria",
      "Owner" : "APA"
    }
  }
  spec {
    cluster_group = var.cluster_group
    config {
      location           = var.region
      kubernetes_version = var.kubernetes_version
      network_config {
        dns_prefix = "dns-tf"
      }
    }
    nodepool {
      name = "nodepool1"

      spec {
        count   = var.node_count
        mode    = "SYSTEM"
        vm_size = var.node_size
        auto_scaling_config {
          enable = false
          
        }
        upgrade_config {
          max_surge = "1"
        }        
      }
    }
  }
}