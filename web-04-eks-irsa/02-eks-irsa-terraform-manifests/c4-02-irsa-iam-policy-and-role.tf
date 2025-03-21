resource "aws_iam_role" "irsa_iam_role" {
  name = "${local.name}-irsa-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:sts:AssumeRoleWithWebIdentity"
      Sid    = ""
      Principal = {
        Federated = "${data.terraform_remote_state.eks.outputs.aws_iam_openid_connect_provider_arn}"
      }
      Condition = {
        StringEquals = {
          "${data.terraform_remote_state.eks.outputs.aws_iam_openid_connect_provider_extract_from_arn}:sub" : "system:serviceaccount:default:irsa-demo-sa"
        }
      }
    }]
  })

  tags = {
    tag-key = "${local.name}-irsa-iam-role"
  }
}

resource "aws_iam_role_policy_attachment" "irsa_role_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role       = aws_iam_role.irsa_iam_role.name
}

output "irsa_iam_role_arn" {
  value = aws_iam_role.irsa_iam_role.arn
}