
#instance for testing workspace shifting
resource "aws_instance" "ec2_workspace" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = local.instance_type[terraform.workspace]
  tags = {
    Name = "MyFirst instance"
  }
}