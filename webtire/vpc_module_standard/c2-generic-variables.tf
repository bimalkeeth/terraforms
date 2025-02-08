variable "aws_region" {
  description = "AWS region"
  type = string
  default = "us-east-1"
}

variable "environment" {
  description = "Environment"
  type = string
  default = "dev"
}

variable "business_division" {
  description = "business division in the large organisation"
  type = string
  default = "sap"
}