
resource "aws_security_group" "terraform-firewall" {
  name = "terraform-firewall"
  description = "Allow incoming traffic instances manage from terraform"
  vpc_id = "vpc-06f35e698001b95bf"
}

resource "aws_vpc_security_group_ingress_rule" "allow80-ingress-ipv4" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.terraform-firewall.id
  from_port = var.http_port
  to_port = var.http_port
  cidr_ipv4 = "${aws_eip.elasticip_access.public_ip}/32"
}


resource "aws_vpc_security_group_ingress_rule" "allow22-ingress-ipv4" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.terraform-firewall.id
  from_port = var.ssh_port
  to_port = var.ssh_port
  cidr_ipv4 = "${aws_eip.elasticip_access.public_ip}/32"
}

resource "aws_vpc_security_group_ingress_rule" "allow21-ingress-ipv4" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.terraform-firewall.id
  from_port = var.ftp_port
  to_port = var.ftp_port
  cidr_ipv4 = "${aws_eip.elasticip_access.public_ip}/32"
}

resource "aws_vpc_security_group_egress_rule" "allow-all-traffic-ipv4" {
  security_group_id = aws_security_group.terraform-firewall.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}