output "kubeconfig" {
  value = tanzu-mission-control_tanzu_kubernetes_cluster.tkgs_cluster.spec[0].kubeconfig
}
