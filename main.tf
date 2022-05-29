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

    set {
        name = "image.environment"
        value = "test"
    }

    set {
        name = "image.version"
        value = "latest"
    }
}

resource "helm_release" "kangdroid-cloud-common-config" {
    name = "kdrc-common-config"
    namespace = var.target_namespace

    repository = var.kangdroid_repository
    chart = "kdrc-common-config"
    version = "0.1.2"

    set {
        name = "RabbitMq.Host"
        value = "rabbitmq-service"
    }
}

resource "helm_release" "kangdroid-cloud-mongodb" {
    name = "kdrc-mongodb"
    namespace = var.target_namespace

    repository = var.kangdroid_repository
    chart = "mongodb-test"
    version = "0.1.1"
}

resource "helm_release" "kangdroid-cloud-rabbitmq" { 
    name = "kdrc-rabbitmq-release"
    namespace = var.target_namespace

    repository = var.kangdroid_repository
    chart = "kdrc-rabbitmq"
    version = "0.1.0"
}