

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.myimage.image_id
  instance_type = "t2.micro"
  tags = {
    Name = "MyFirst instance"
  }
}