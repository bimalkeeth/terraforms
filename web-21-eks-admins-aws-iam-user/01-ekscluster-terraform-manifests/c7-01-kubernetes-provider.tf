#data source
data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.eks-cluster.id
}

#terraform kubernetes provider
provider "kubernetes" {
  host = aws_eks_cluster.eks-cluster.endpoint
  client_certificate = base64decode(aws_eks_cluster.eks-cluster.certificate_authority[0].data)
  token = data.aws_eks_cluster_auth.cluster.token
}