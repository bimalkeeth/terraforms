variable "aws_region" {
  description = "aws region"
  type = string
  default = "us-east-1"
}


variable "environment" {
  description = "Environment tag, e.g prod"
  type    = string
  default = "dev"
}

variable "business_division" {
  description = "Software or License"
  type    = string
  default = "SAP"
}