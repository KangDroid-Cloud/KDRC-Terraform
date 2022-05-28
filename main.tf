provider "helm" {
    kubernetes {
        config_path = "~/.kube/config"
    }
}

provider "kubernetes" {
    config_path = "~/.kube/config"
}

variable "target_namespace" {
    description = "Namespace to deploy cloud in."
    type = string
    nullable = false
}

variable "kangdroid_repository" {
    description = "KangDroid-Cloud Repository"
    type = string
    default = "https://kangdroid-cloud.github.io/chart/release"
}

resource "kubernetes_namespace_v1" "target-namespace" {
    metadata {
      name = var.target_namespace
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