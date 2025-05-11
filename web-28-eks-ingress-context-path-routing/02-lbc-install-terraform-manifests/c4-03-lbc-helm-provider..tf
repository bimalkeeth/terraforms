data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}

provider "helm" {
  kubernetes {
     host = data.terraform_remote_state.eks.outputs.cluster_endpoint
     client_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_cretificate_authority_data)
     token = data.aws_eks_cluster_auth.cluster.token
  }
}