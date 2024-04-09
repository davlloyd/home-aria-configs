variable "endpoint" {
  description = "The Tanzu Mission Control service endpoint hostname"
  type = string
  default = "mapbuapj.tmc.cloud.vmware.com"
}

variable "vmw_cloud_api_token" {
  description = "The VMware Cloud Services API Token"
  type = string
  default = "api-token"
}

variable "aws_credential_name" {
  description = "AWS Credential Name"
  type = string
  default = "dkari-eks"
}

variable "cluster_name" {
  description = "The Name of the cluster"
  type = string
  default = "myekscluster1"
}

variable "cluster_description" {
  description = "Description of the cluster to be created"
  type = string
  default = "Aria managed cluster"
}

variable "cluster_group" {
  description = "The Name of the cluster group to asign the cluster"
  type = string
  default = "apa-public-workload"
}

variable "region" {
  description = "Region where cluster will be deployed"
  type = string
  default = "ap-southeast-2"
}

variable "kubernetes_version" {
  description = "Kubernetes Version for cluster"
  type = string
  default = "1.26"
}

variable "service_cidr_range" {
    description = "Service CIDR"
    type = string
    default = "172.20.0.0/16"
} 

variable "controlplane_role_arn" {
    description = "Control Plane ARN Role"
    type = string
    default = "arn:aws:iam::600286439047:role/control-plane.16099833002507910932.eks.tmc.cloud.vmware.com"
}

variable "node_role_arn" {
    description = "Nodepool Plane ARN Role"
    type = string
    default = "arn:aws:iam::600286439047:role/worker.16099833002507910932.eks.tmc.cloud.vmware.com"
}

variable "ami_type" {
    description = "Nodepool AMI Type"
    type = string
    default = "AL2_x86_64"
}

variable "node_instance_type" {
    description = "Node config instance type"
    type = string
    default = "t3.medium"
}

variable "node_count" {
    description = "Node count"
    type = string
    default = "2"
}

