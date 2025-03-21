
resource "aws_eip" "elasticip_access" {

}

resource "aws_eip_association" "eip_assoc" {
  instance_id = aws_instance.eip-associated-instance.id
  allocation_id = aws_eip.elasticip_access.id
}

resource "aws_instance" "eip-associated-instance" {
  ami = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
}
