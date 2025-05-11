terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.4.1"
    }
  }

  backend "s3" {
    bucket = "terraform-on-aws-eks-bimal"
    key    = "dev/aws-lbc-ingress/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-aws-lbc-ingress"
  }
}