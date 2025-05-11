# Resource: Cluster Role
resource "kubernetes_cluster_role_v1" "eks_readonly_cluster_role" {
  metadata {
    name = "${local.name}eks-readonly-cluster-role"
  }

  rule {
    api_groups = [""] # These come under core APIs
    resources  = ["nodes", "namespaces", "pods", "events", "services"]  #resources  = ["nodes", "namespaces", "pods", "events", "services", "configmaps", "serviceaccounts"] #Uncomment for additional Testing
    verbs = ["get", "list"]
  }
  rule {
    api_groups = ["apps"]
    resources  = ["deployments", "daemonsets", "statefulsets", "replicasets"]
    verbs      = ["get", "list"]
  }
  rule {
    api_groups = ["batch"]
    resources  = ["jobs"]
    verbs      = ["get", "list"]
  }
}


resource "kubernetes_cluster_role_binding_v1" "eks_readonly_role_binding" {
  metadata {
    name = "${local.name}-eksreadonly-clusterrolebinding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name = kubernetes_cluster_role_v1.eks_readonly_cluster_role.metadata.0.name
  }

  subject {
    kind      = "Group"
    name = "eks-readonly-group"
    api_group = "rbac.authorization.k8s.io"
  }
}