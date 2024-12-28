resource "aws_instance" "my_ec2_instances" {
  ami = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  count = 3
  tags = {
    Name = "payment-system-${count.index}"
  }
}

