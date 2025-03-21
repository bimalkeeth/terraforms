resource "helm_release" "abs_csi_drivers" {
  depends_on = [aws_iam_role.ebs_csi_iam_role]
  name       = "${local.name}-aws_ebs_csi_drivers"
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-drive"
  chart      = "aws-ebs-csi-driver"
  namespace  = "kube-system"

  set {
    name  = "image.repository"
    value = "602401143452.dkr.ecr.us-east-1.amazonaws.com/eks/aws-ebs"
  }

  set {
    name  = "controller.serviceAccount.create"
    value = "true"
  }

  set {
    name  = "controller.serviceAccount.name"
    value = "ebs-csi-controller-sa"
  }

  set {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = "${aws_iam_role.ebs_csi_iam_role.arn}"
  }
}