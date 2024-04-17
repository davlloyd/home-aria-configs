output "kubeconfig" {
  value = base64decode(tanzu-mission-control_tanzu_kubernetes_cluster.tkgs_cluster.spec[0].kubeconfig)
}
