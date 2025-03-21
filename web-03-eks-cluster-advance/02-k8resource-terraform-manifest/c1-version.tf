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
    key    = "dev/app1k8s/terraform.tfstate"
    region = "us-east-1"
    #used for state locking
    dynamodb_table = "dev-app1k8s"
  }
}

