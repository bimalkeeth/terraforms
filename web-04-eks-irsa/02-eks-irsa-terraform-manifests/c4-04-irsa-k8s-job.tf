resource "kubernetes_job_v1" "irsa_demo" {
  metadata {
    name = "irsa_demo"
  }

  spec {
    template {
      metadata {
        labels = {
          app = "irsa_demo"
        }
      }

      spec {
        service_account_name = kubernetes_service_account_v1.irsa_demo-sa.metadata.0.name
        container {
          name  = "irsa_demo"
          image = "amazon/aws-cli:latest"
          args  = ["s3", "ls"]
        }
        restart_policy = "Never"
      }
    }
  }
}