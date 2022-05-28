provider "helm" {
    kubernetes {
        config_path = "~/.kube/config"
    }
}

resource "helm_release" "kangdroid-cloud-core" {
    name = "kdrc-core"
    namespace = var.target_namespace

    repository = var.kangdroid_repository
    chart = "kdrc-core-chart"
    version = "0.1.1"
}

resource "helm_release" "kangdroid-cloud-common-config" {
    name = "kdrc-common-config"
    namespace = var.target_namespace

    repository = var.kangdroid_repository
    chart = "kdrc-common-config"
    version = "0.1.0"
}

resource "helm_release" "kangdroid-cloud-mongodb" {
    name = "kdrc-mongodb"
    namespace = var.target_namespace

    repository = var.kangdroid_repository
    chart = "mongodb-test"
    version = "0.1.0"
}