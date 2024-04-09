
provider "tanzu-mission-control" {
  endpoint = var.endpoint
  vmw_cloud_api_token = var.vmw_cloud_api_token
}

resource "tanzu-mission-control_ekscluster" "aria_eks_cluster" {
  credential_name = var.aws_credential_name
  region          = var.region 
  name            = var.cluster_name

  ready_wait_timeout = "30m"

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
      role_arn           = var.controlplane_role_arn
      kubernetes_version = var.kubernetes_version
      tags               = { "createdBy" : "terraform" }

      kubernetes_network_config {
        service_cidr = var.service_cidr_range
      }

      logging {
        api_server         = false
        audit              = true
        authenticator      = true
        controller_manager = false
        scheduler          = true
      }

      vpc { 
        enable_private_access = true
        enable_public_access  = true
        public_access_cidrs = [
          "0.0.0.0/0",
        ]
        
        security_groups = [
        ]
        
        subnet_ids = [
          //"subnet-076035956fdd3420d",
          //"subnet-0f7aa2989ed5f045b",
          //"subnet-0ffb0456ccdf1b730",
          //"subnet-0e3b4f62c150066e1",
          //"subnet-086d851cb813dd60c",
          //"subnet-047c08d028db17ad3",
        ]
      }
    }

    nodepool {
      info {
        name        = "nodepool1"
        description = "Default Node Pool"
      }

      spec {
        role_arn       = var.node_role_arn
        ami_type       = var.ami_type
        capacity_type  = "ON_DEMAND"
        root_disk_size = 50

        subnet_ids = [
          //"subnet-076035956fdd3420d",
          //"subnet-0f7aa2989ed5f045b",
          //"subnet-0ffb0456ccdf1b730",
          //"subnet-0e3b4f62c150066e1",
          //"subnet-086d851cb813dd60c",
          //"subnet-047c08d028db17ad3",
        ]

        // ami_info {
        //  ami_id                 = "<aws-ami-id>"
        //  override_bootstrap_cmd = "<ami-bootstrap-command>"
        // }

        scaling_config {
          desired_size = var.node_count
          max_size     = var.node_count
          min_size     = var.node_count
        }

        update_config {
          max_unavailable_nodes = "1"
        }

        instance_types = [
          var.node_instance_type,
        ]
      }
    }
  }
}