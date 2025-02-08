
output "public_ip" {
  value = aws_eip.elasticip_access.public_ip
}