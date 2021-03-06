data "digitalocean_kubernetes_cluster" "k8s" {
  name = var.do_k8s_name
  depends_on = [var.do_k8s_name]
}

data "digitalocean_project" "do_project" {
  id = var.do_project_id
  depends_on = [var.do_project_id]
}