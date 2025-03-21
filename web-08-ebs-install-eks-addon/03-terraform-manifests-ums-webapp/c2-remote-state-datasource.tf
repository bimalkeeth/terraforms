data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "terraform-on-aws-eks-bimal"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1"
  }
}