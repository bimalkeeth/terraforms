resource "aws_iam_role" "eks-master-role" {
  name               = "${local.name}-eks-master-role"
  assume_role_policy = <<POLICY
  {
      "Version": "2012-10-17",
      "Statement": [{
        "Effect" : "Allow",
        "Principal": { "Service": "eks.amazonaws.com" },
        "Action": "sts:AssumeRole"
      }]
  }

  POLICY
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-master-role.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks-master-role.name
}
