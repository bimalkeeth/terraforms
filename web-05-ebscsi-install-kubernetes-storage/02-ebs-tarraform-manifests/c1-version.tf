terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.16.1"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 2.1"
    }
  }

  backend "s3" {
    bucket = "terraform-on-aws-eks-bimal"
    key    = "dev/ebs-storage/terraform.tfstate"
    region = var.aws_region
    #used for state locking
    dynamodb_table = "dev-ebs-storage"
  }
}

provider "aws" {
  region = var.aws_region
}

provider "http" {
}

