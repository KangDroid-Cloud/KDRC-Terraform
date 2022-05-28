provider "kubernetes" {
    config_path = "~/.kube/config"
}

resource "kubernetes_namespace_v1" "target-namespace" {
    metadata {
      name = var.target_namespace
    }
}