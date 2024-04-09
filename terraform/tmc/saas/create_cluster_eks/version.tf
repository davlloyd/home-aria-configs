terraform {
  required_providers {
    tanzu-mission-control = {
      source = "vmware/tanzu-mission-control"
      version = ">= 1.4.4"
    }
  }
  required_version = ">= 1.0.0"
}
