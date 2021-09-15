resource "helm_release" "istio_base" {
  name = "istio-base"
  chart = "base"
  repository = var.istio_helm_repository
  version = var.istio_helm_version

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = var.istio_namespace

  create_namespace = true
}

resource "helm_release" "istiod" {
  name  = "istiod"
  chart = "istiod"
  repository = var.istio_helm_repository
  version = var.istio_helm_version

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = var.istio_namespace

  create_namespace = true

  depends_on = [helm_release.istio_base]
}

resource "helm_release" "istio_ingress" {
  name  = "istio-ingress"
  chart = "gateways"
  repository = var.istio_helm_repository
  version = var.istio_helm_version

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = var.istio_namespace

  create_namespace = true

  depends_on = [helm_release.istiod]
}