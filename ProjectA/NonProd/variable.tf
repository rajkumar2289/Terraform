variable "ami"{
  default = aws_key_pair.deployer.id
}
variable "key_name" {
  default = "test"
}
