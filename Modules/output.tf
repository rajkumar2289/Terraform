output "publicIp" {
  value = aws_instance.app-dev[0].public_ip
}