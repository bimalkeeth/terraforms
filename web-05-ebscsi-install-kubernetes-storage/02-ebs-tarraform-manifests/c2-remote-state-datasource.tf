terraform {
  required_providers {
    terraform = {
      source  = "builtin/terraform"
      version = ""
    }
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket="terraform-on-aws-eks-bimal"
    key="dev/eks-irsa-demo/terraform.tfstate"
    region  = var.aws_region
  }
}