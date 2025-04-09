# Resource: k8s Cluster Role
resource "kubernetes_cluster_role_v1" "eks_developer_cluster_role" {
  metadata {
    name = "${local.name}-eks-developer-cluster-role"
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "nodes","namespaces","events","services"]
    verbs = ["get","list"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["deployments", "daemonsets", "statefulsets", "replicasets"]
    verbs = ["get", "list"]
  }

  rule {
    api_groups = ["batch"]
    resources  = ["jobs"]
    verbs      = ["get", "list"]
  }
}


#resource role binding
resource "kubernetes_cluster_role_binding_v1" "eks_developer_cluster_role_binding" {
  metadata {
    name = "${local.name}-eks-developer-cluster-role-binding"

  }

  role_ref {
      api_group = "rbac.authorization.k8s.io"
      kind      = "ClusterRole"
      name =kubernetes_cluster_role_v1.eks_developer_cluster_role.metadata.0.name
    }

  subject {
    kind      = "Group"
    name      = "eks-developer-group"
    api_group = "rbac.authorization.k8s.io"
  }
}