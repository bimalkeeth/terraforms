resource "kubernetes_deployment_v1" "mysql_deployment" {
  metadata {
    name = "nysql"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        volume {
          name = "mysql-persistent-storage"
          persistent_volume_claim {
            claim_name = "ebs-mysql-pv-claim"
          }
        }

        volume {
          name = "usermanagement-dbcreation-script"
          config_map {
            name = kubernetes_config_map_v1.config_map.metadata.0.name
          }
        }

        container {
          image = "mysql:5.0"
          name  = "mysql"
          port {
            container_port = 3306
            name = "mysql"
          }
          env {
            name = "MYSQL_ROOT_PASSWORD"
            value = "dbpassword11"
          }
          volume_mount {
            mount_path = "/var/lib/mysql"
            name       = "mysql-persistent-storage"
          }
          volume_mount {
            mount_path = "/docker-entrypoint-initdb.d" #https://hub.docker.com/_/mysql Refer Initializing a fresh instance
            name       = "usermanagement-dbcreation-script"
          }
        }
      }
    }
  }
}