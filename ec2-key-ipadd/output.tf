output "ip" {
  value = aws_eip.ip.public_ip
  description = "The private IP address of the main server instance."
}


