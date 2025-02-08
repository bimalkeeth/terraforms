terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 4.0"        # Use a version of the AWS provider that is compatible with version
    }
  }
}

provider "aws" {
  region = "us-east-1" # Set the AWS region to US East (N. Virginia)
}

resource "aws_instance" "aws_example" {
  security_groups = [aws_security_group.allow-ssh]

  tags = {
    Name = "ExampleInstance"
    # Tag the instance with a Name tag for easier identification
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
    delete_on_termination = true
  }
}

resource "aws_eip" "my_eip" {
  instance = aws_instance.aws_example.id
}

resource "aws_security_group" "allow-ssh" {
  vpc_id = "${}"
  name = "allow-ssh"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"
  size = 20
  type = "gp2"
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.aws_example.id
}


resource "aws_security_group" "test" {
  name = "sgtest"
  egress {}
  dynamic "ingress" {
    for_each = [22,443]
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
    }
  }
}