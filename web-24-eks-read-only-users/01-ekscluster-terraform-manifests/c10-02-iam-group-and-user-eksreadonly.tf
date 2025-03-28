
# Resource: AWS IAM Group
resource "aws_iam_group" "eks_readonly_iam_group"{
  name = "${local.name}-eks-read-only"
  path = "/"
}


# Resource: AWS IAM Group Policy
resource "aws_iam_group_policy" "eks_readonly_iam_group_policy"{
  name = "${local.name}-eks-read-only-group-policy"
  group = aws_iam_group.eks_readonly_iam_group.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = ["sts:AssumeRole"]
      Effect   = "Allow"
      Resource = aws_iam_role.eks_readonly_role.arn
      Sid = "AllowAssumeOrganizationAccountRole"
    }]
  })
}

# Resource: AWS IAM User
resource "aws_iam_user" "eks_readonly_user" {
  name = "${local.name}-eks-readonly1"
  path = "/"
  force_destroy = true
  tags = local.common_tags
}

# Resource: AWS IAM Group Membership
resource "aws_iam_group_membership" "eks_readonly" {
  name = "${local.name}-eks-readonly-group-membership"
  users = [
  aws_iam_user.eks_readonly_user.name]
  group = aws_iam_group.eks_readonly_iam_group.name
}
