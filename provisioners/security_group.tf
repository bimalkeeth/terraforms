

resource "aws_security_group" "terraform_sg" {
  name = "terraform-sg"
  description = "Allow incoming traffic instances manage from terraform"
}

resource "aws_vpc_security_group_ingress_rule" "allow22_ingress_ipv4" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.terraform_sg.id
  from_port = 22
  to_port = 22
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow80_ingress_ipv4" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.terraform_sg.id
  from_port = 80
  to_port = 80
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.terraform_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}