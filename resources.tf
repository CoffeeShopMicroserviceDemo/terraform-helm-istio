resource "helm_release" "istio_base" {
  name = "istio-base"
  chart = "base"
  repository = var.istio_helm_repository
  version = var.istio_helm_version

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = kubernetes_namespace.istio_namespace.metadata.name

  depends_on = [kubernetes_namespace.istio_namespace]
}

resource "helm_release" "istiod" {
  name  = "istiod"
  chart = "istiod"
  repository = var.istio_helm_repository
  version = var.istio_helm_version

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = kubernetes_namespace.istio_namespace.metadata.name

  depends_on = [kubernetes_namespace.istio_namespace, helm_release.istio_base]
}

resource "helm_release" "istio_ingress" {
  name  = "istio-ingress"
  chart = "gateways"
  repository = var.istio_helm_repository
  version = var.istio_helm_version

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = kubernetes_namespace.istio_namespace.metadata[0].name

  depends_on = [kubernetes_namespace.istio_namespace, helm_release.istiod]
}

resource "kubernetes_namespace" "istio_namespace" {
  metadata {
    name = var.istio_namespace
  }
}