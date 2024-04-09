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


# Create Tanzu Mission Control git repository with attached set as default value.
resource "tanzu-mission-control_git_repository" "create_cluster_group_git_repository" {
  name = "tf-git-repository-name" # Required

  namespace_name = "tf-namespace" #Required

  scope {
    cluster_group {
      name = "default" # Required
    }
  }

  meta {
    description = "Create namespace through terraform"
    labels      = { "key" : "value" }
  }

  spec {
    url                = "testGitRepositoryURL" # Required
    secret_ref         = "testSourceSecret"
    interval           = "10m"    # Default: 5m
    git_implementation = "GO_GIT" # Default: GO_GIT
    ref {
      branch = "testBranchName"
      tag    = "testTag"
      semver = "testSemver"
      commit = "testCommit"
    }
  }
}

# Create Tanzu Mission Control kustomization with attached set as default value.
resource "tanzu-mission-control_kustomization" "create_cluster_group_kustomization" {
  name = "tf-kustomization-name" # Required

  namespace_name = "tf-namespace" #Required

  scope {
    cluster_group {
      name = "default" # Required
    }
  }

  meta {
    description = "Create namespace through terraform"
    labels      = { "key" : "value" }
  }

  spec {
    path             = "testPath" # Required
    prune            = "testPrune"
    interval         = "10m" # Default: 5m
    target_namespace = "testTargetNamespace"
    source {
      name      = "testGitRepositoryName"      # Required
      namespace = "testGitRepositoryNamespace" # Required
    }
  }
}
