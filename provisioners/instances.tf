resource "aws_instance" "provisioner-ec2" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  tags = {
    Name = "MyFirst instance"
  }

  key_name = "terraform"
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./terraform.pem")
    host = self.public_ip

  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}