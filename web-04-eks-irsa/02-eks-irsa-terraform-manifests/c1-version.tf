terraform {
  required_version = ">= 0.14"
  required_providers {
     aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    },
     kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }

  backend "s3" {
    bucket = "terraform-on-aws-eks-bimal"
    key    = "dev/eks-irsa-demo/terraform.tfstate"
    region = var.aws_region
    #used for state locking
    dynamodb_table = "dev-eks-irsa-demo-bimal"
  }
}

