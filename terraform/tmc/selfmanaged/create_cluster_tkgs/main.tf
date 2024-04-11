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


locals {
  tkgs_cluster_variables = {
    //"controlPlaneCertificateRotation" : {
    //  "activate" : true,
    //  "daysBefore" : 30
    //},
    "defaultStorageClass" : var.storage_class,
    //"defaultVolumeSnapshotClass" : "volumesnapshotclass-delete",
    "nodePoolLabels" : [

    ],
    "nodePoolVolumes" : [
      {
        "capacity" : {
          "storage" : var.containerd_disk
        },
        "mountPath" : "/var/lib/containerd",
        "name" : "containerd",
        "storageClass" : var.storage_class
      },
      {
        "capacity" : {
          "storage" : var.kubelet_disk
        },
        "mountPath" : "/var/lib/kubelet",
        "name" : "kubelet",
        "storageClass" : var.storage_class
      }

    ],
    "ntp" : var.ntp_server,
    "storageClass" : var.storage_class,
    "storageClasses" : [
      var.storage_class
    ],
    "vmClass" : var.vm_class
  }

  tkgs_nodepool_a_overrides = {
    "nodePoolLabels" : [
      {
        "key" : "sample-worker-label",
        "value" : "value"
      }
    ],
    "storageClass" : var.storage_class,
    "vmClass" : var.vm_class
  }
}

resource "tanzu-mission-control_tanzu_kubernetes_cluster" "tkgs_cluster" {
  name                    = var.cluster_name
  management_cluster_name = var.management_cluster_name
  provisioner_name        = var.provisioner_name

  spec {
    cluster_group_name = var.cluster_group_name

    topology {
      version           = var.kubernetes_version
      cluster_class     = var.cluster_class
      cluster_variables = jsonencode(local.tkgs_cluster_variables)

      control_plane {
        replicas = var.control_plane_replicas

        os_image {
          name    = "photon"
          version = "3"
          arch    = "amd64"
        }
      }

      nodepool {
        name        = "md-0"
        description = "simple small md"

        spec {
          worker_class = "node-pool"
          replicas     = var.worker_node_replicas
          overrides    = jsonencode(local.tkgs_nodepool_a_overrides)

          os_image {
            name    = "photon"
            version = "3"
            arch    = "amd64"
          }
        }
      }

      network {
        pod_cidr_blocks = [
          var.pod_cidr_block,
        ]
        service_cidr_blocks = [
          var.service_cidr_block,
        ]
        service_domain = var.service_domain
      }
    }
  }

  timeout_policy {
    timeout             = 60
    wait_for_kubeconfig = true
    fail_on_timeout     = true
  }
}