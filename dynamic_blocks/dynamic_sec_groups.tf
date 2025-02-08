
resource "aws_security_group" "dynamic_sg"{
  name = "sample-sg"
  description = "Allows access from defined security groups"
  vpc_id = "vpc-06f35e698001b95bf"

  dynamic "ingress" {
    for_each = var.sg_ports

    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}