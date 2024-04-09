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

variable "group_name" {
  description = "The Name of the cluster"
  type = string
  default = "mygroup1"
}

variable "group_description" {
  description = "A description of the cluster group"
  type = string
  default = "Aria created cluster group"
}
