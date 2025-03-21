resource "kubernetes_service_account_v1" "irsa_demo-sa" {
  depends_on = [aws_iam_role_policy_attachment.irsa_role_policy_attachment]
  metadata {
    name = "irsa_demo-sa"
    annotations = {
       "eks.amazonaws.com/role-arn" =aws_iam_role.irsa_iam_role.arn

    }
  }
}