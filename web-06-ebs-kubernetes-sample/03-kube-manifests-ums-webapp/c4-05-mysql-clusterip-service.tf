resource "kubernetes_service_v1" "mysql_clusterip_service" {
  metadata {
    name = "mysql"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.mysql_deployment.spec.0.selector.0.match_labels.app
    }

    port {
      port        = 3306
    }

    type = "ClusterIP"
    cluster_ip = "None"
  }
}

