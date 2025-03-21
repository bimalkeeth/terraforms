
variable "aws_region" {
  description = "The AWS region to create things in."
  type = string
  default = "us-east-1"
}


variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
  validation {
    condition = contains(["t2.micro"], var.instance_type)
  }
}

variable "instance_keypair" {
  description = "EC2 instance keypair"
  type = string
  default = "terraform"
}