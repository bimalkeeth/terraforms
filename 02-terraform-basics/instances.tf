resource "aws_instance" "ec2_demo" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance" # Tag the instance with a Name tag for easier identification
  }
}