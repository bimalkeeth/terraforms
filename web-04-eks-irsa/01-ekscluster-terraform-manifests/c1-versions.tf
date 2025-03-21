terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "terraform-on-aws-eks-bimal"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = var.aws_region
    #used for state locking
    dynamodb_table = "dev-ekscluster"
  }
}

provider "aws" {
  region = var.aws_region
}

