resource "aws_instance" "vm_ec2" {
  ami ="ami-01816d07b1128cd2d"
  instance_type = var.types_my_ec2["us-east-1"]


}