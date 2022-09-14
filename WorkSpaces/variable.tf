variable "instance_type" {
  type = map

  default = {
    default = "t2.nano"
    NonProd     = "t2.micro"
    Prod     = "t2.large"
  }
}