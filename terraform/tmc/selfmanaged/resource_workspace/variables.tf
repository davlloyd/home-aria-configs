variable "endpoint" {
  description = "The Tanzu Mission Control service endpoint hostname"
  type = string
  default = "tmc.home.tanzu.rocks"
}

variable "insecure_allow_unverified_ssl" {
  description = "Disable certificate verification"
  type = bool
  default = true
}

variable "oidc_issuer" {
  description = "The pinnipped supervisor oidc issuer url "
  type = string
  default = "pinniped-supervisor.tmc.home.tanzu.rocks"
}

variable "username" {
  description = "The account name for authenticaiton into TMC"
  type = string
  default = "test"
}

variable "password" {
  description = "Password for authentication into TMC"
  type = string
  default = "B3ach8um"
}

variable "workspace_name" {
  description = "name to assign to the workspace"
  type = string
  default = "workspace-test"
}

variable "workspace_description" {
  description = "Description of the workspace"
  type = string
  default = "Aria managed workspace"
}
