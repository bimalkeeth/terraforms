

# Resource: AWS IAM Role
resource "aws_iam_role" "eks_admin_role" {
  name = "${local.name}-eks-admin-role"
  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = ""
          Principal = {
            AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
          }
        }
      ]

    }
  )

   tags = {
    tag-key = "${local.name}-eks-admin-role"
  }

}


resource "aws_iam_role_policy" "eks_full_access_policy" {
  name = "eks-full-access-policy"
  role = aws_iam_role.eks_admin_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
            "iam:ListRoles",
            "eks:*",
            "iam:PassRole",
            "ssm:GetParameter"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}