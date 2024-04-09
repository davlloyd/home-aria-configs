variable "endpoint" {
  description = "The Tanzu Mission Control service endpoint hostname"
  type = string
  default = "mapbuapj.tmc.cloud.vmware.com"
}

variable "vmw_cloud_api_token" {
  description = "The VMware Cloud Services API Token"
  type = string
  default = "api_key"
}

variable "cluster_name" {
  description = "The Name of the cluster"
  type = string
  default = "mycluster1"
}

variable "cluster_description" {
  description = "Description of the cluster to be created"
  type = string
  default = "Aria managed cluster"
}

variable "cluster_group" {
  description = "The Name of the cluster group to asign the cluster"
  type = string
  default = "apa-test"
}

variable "kubernetes_version" {
  description = "Kubernetes Version for cluster"
  type = string
  default = "1.26.6"
}

variable "region" {
  description = "Region where cluster will be deployed"
  type = string
  default = "australiaeast"
}

variable "node_size" {
  description = "Size for the cluster nodes"
  type = string
  default = "Standard_DS2_v2"
}

variable "node_count" {
  description = "Number of worker nodes for cluster"
  type = integer
  default = 1
}
