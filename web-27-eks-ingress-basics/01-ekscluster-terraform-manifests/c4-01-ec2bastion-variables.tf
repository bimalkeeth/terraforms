variable "instance_type" {
  description = "EC2 machine types"
  type        = string
  default     = "t3.micro"
}


variable "instance_key_pair" {
  description = "AWS instance SSH Key"
  type        = string
  default     = "eks-terraform-key"
}