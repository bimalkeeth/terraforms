resource "kubernetes_role_v1" "eks_developer_role" {
  metadata {
    name = "${local.name}-eks-developer-role"
    namespace = kubernetes_namespace_v1.k8s_dev.metadata.0.name
  }

  rule {
    api_groups = ["", "apps", "extensions"]
    resources = ["*"]
    verbs = ["*"]
  }

  rule {
    api_groups = ["batch"]
    resources = ["jobs", "cronjobs"]
    verbs = ["*"]
  }
}


resource "kubernetes_role_binding_v1" "eks_developer_role_binding" {
  metadata {
    name = "${local.name}-eks-developer-role-binding"
    namespace = kubernetes_namespace_v1.k8s_dev.metadata.0.name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name = kubernetes_role_v1.eks_developer_role.metadata.0.name
  }

  subject {
    kind      = "Group"
    name      = "eks-developer-group"
    api_group = "rbac.authorization.k8s.io"
  }
}