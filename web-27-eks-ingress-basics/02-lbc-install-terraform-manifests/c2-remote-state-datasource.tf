data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "terraform-on-aws-eks-bimal"
    key    = "dev/aws-lbc/terraform.tfstate"
    region = var.aws_region
  }
}