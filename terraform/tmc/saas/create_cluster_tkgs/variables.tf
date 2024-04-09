variable "endpoint" {
  description = "The Tanzu Mission Control service endpoint hostname"
  type = string
  default = "mapbuapj.tmc.cloud.vmware.com"
}

variable "vmw_cloud_api_token" {
  description = "The VMware Cloud Services API Token"
  type = string
  default = "API-KEY"
}

variable "management_cluster_name" {
  description = "The Tanzu Mission Control entry for the TKG Supervisor cluster"
  type = string
  default = "vcf-anz-supervisor-mc01"
}

variable "provisioner_name" {
  description = "Namespace (provisioner) where cluster is to be deployed"
  type = string
  default = "beta"
}

variable "cluster_name" {
  description = "The Name of the cluster"
  type = string
  default = "tkgs-cluster-1"
}

variable "cluster_description" {
  description = "Description of the cluster to be created"
  type = string
  default = "Aria managed cluster"
}

variable "cluster_group_name" {
  description = "The Name of the cluster group to asign the cluster to"
  type = string
  default = "syd-vcf-hub-workload"
}

variable "vm_class" {
  description = "Node configuration class"
  type = string
  default = "best-effort-medium"
}

variable "storage_class" {
  description = "Storage profile to assign to the cluster"
  type = string
  default = "k8s-general-storage"
}

variable "kubernetes_version" {
  description = "Tanzu Kubernetes release TKR for cluster"
  type = string
  default = "v1.24.9+vmware.1-tkg.4"
}

variable "cluster_class" {
  description = "Cluster class to be used"
  type = string
  default = "tanzukubernetescluster"
}

variable "service_cidr_block" {
    description = "Service CIDR Block"
    type = string
    default = "172.20.0.0/16"
} 

variable "pod_cidr_block" {
    description = "Pod CIDR Block"
    type = string
    default = "172.21.0.0/16"
} 

variable "service_domain" {
    description = "Domain name to use for internal services"
    type = string
    default = "cluster.local"
}

variable "control_plane_replicas" {
    description = "Controller Plane node count"
    type = number
    default = 1
}

variable "worker_node_replicas" {
    description = "Worker node count"
    type = number
    default = 3
}

variable "ntp_server" {
    description = "NTP Servers to assign to cluster"
    type = string
    default = "pool.ntp.org"
}

