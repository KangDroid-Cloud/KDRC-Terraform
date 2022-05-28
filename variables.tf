variable "kangdroid_repository" {
    description = "KangDroid-Cloud Repository"
    type = string
    default = "https://kangdroid-cloud.github.io/chart/release"
}

variable "target_namespace" {
    description = "Namespace to deploy cloud in."
    type = string
    nullable = false
}