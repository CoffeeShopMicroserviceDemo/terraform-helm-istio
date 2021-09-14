variable "istio_helm_repository" {
  description = "Location of the helm repository for istio"
  type = string
  default = "https://istio-release.storage.googleapis.com/charts"
}

variable "istio_helm_version" {
  description = "Istio helm repository version"
  type = string
  default = "1.12.0-alpha.1"
}

variable "istio_namespace" {
  description = "Istio Namespace"
  type = string
  default = "istio-system"
}

variable "do_token" {
  description = "Digital Ocean Personal access token"
  type        = string
  default     = ""
}

variable "do_k8s_name" {
  description = "Digital Ocean Kubernetes cluster name (e.g. `k8s-do`)"
  type        = string
  default     = "k8s-do"
}

variable "do_project_name" {
  description = "Digital Ocean project name"
  type = string
  default = "istio"
}