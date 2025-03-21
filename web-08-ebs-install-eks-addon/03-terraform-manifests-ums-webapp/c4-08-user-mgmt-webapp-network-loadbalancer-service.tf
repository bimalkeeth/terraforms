resource "kubernetes_service_v1" "network_lb_service" {
  metadata {
    name = "usermgmt-webapp-network-lb-service"
    annotations = {
       "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }

  spec {
    selector = {
      app=kubernetes_deployment_v1.mysql_deployment.spec.0.selector.0.match_labels.app
    }

    port {
      port = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}