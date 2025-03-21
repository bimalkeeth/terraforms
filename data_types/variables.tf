variable "user_name" {
  type = number                     # The type of the variable, in this case a string
  default =5441                # Default value for the variable

}


variable "list" {
  type = list(string)
  default = ["m5.large", "m5.xlarge", "t2.medium"]
}


variable "types_my_ec2" {
  description = "MOJ EC2 Tags Name"
  type        = map(string)
  default = {
     us-east-1 = "t2.micro"
     us-west-2 = "t2.nano"
     ap-south-1 = "t2.small"
  }
}