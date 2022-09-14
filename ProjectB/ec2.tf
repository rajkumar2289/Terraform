module "ec2" {
  source = "../Modules"
  ami    = aws_key_pair.deployer.id
  key_name = var.key_name
  instance_type = var.instance_type
}