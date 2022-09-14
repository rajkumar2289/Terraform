module "ec2" {
  source = "../../Modules"
  ami = var.ami
  key_name = var.key_name
}
