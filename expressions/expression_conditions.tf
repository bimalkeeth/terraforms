
resource "aws_instance" "expt_ec2" {
  ami = "ami-01816d07b1128cd2d"
  instance_type = var.environment=="development"? "t2.micro": "m5.large"
}



