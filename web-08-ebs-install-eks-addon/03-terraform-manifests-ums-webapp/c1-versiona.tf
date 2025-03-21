terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source  = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 4.0"        # Use a version of the AWS provider that is compatible with version
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      #version = "~> 2.7.1"
      version = ">= 2.20"
    }

  }

  backend "s3" {
    bucket = "terraform-on-aws-eks-bimal"
    key = "dev/ebs-sampleapp-demo/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dev-ebs-sampleapp-demo"
  }
}


