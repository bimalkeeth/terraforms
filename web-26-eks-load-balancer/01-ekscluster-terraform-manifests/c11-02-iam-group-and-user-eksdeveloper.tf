resource "aws_iam_group" "developer_iam_group" {
  name = "${local.name}-eks-developer"
  path = "/"
}

# Resource: AWS IAM Group Policy
resource "aws_iam_group_policy" "eksdeveloper_iam_iam_assume_role_policy"{
  name = "${local.name}-eksdeveloper-group-policy"
  group = aws_iam_group.developer_iam_group.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["sts:AssumeRole"]
        Effect   = "Allow"
        Sid    = "AllowAssumeOrganizationAccountRole"
        Resource = aws_iam_role.eks_developer_role.arn
      }
    ]
  })
}

# Resource: AWS IAM User
resource "aws_iam_user" "eks_developer_user" {
  name = "${local.name}-eks-developer1"
  path = "/"
  force_destroy = true
  tags = local.common_tags
}

# Resource: AWS IAM Group Membership
resource "aws_iam_group_membership" "eks_developer_iam_membership" {
  name = "${local.name}-eks-developer1-membership"
  users = [
    aws_iam_user.eks_developer_user.name
  ]

  group = aws_iam_group.developer_iam_group.name
}