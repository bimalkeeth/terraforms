terraform {
  required_version = ">= 0.12"
  required_providers {
    aws ={
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

    helm={
      source  = "hashicorp/helm"
      version = "2.0.3"
    }

    http={
      source  = "hashicorp/http"
      version = "2.0.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.13.3"
    }

  }

  backend "s3" {
    bucket = "terraform-on-aws-eks-bimal"
    key    = "dev/aws-lbc/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dev-aws-lbc"
  }
}

provider "aws" {
   region = var.aws_region
}

provider "http"{

}