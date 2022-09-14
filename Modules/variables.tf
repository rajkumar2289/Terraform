variable "cidr" {
  default = "116.50.30.50/32"
}

variable "instance_name" {
  type = list
  default = ["Dev", "Staging","prod"]
}

variable "ami" { 
default = "ami-0fa49cc9dc8d62c84"
}

variable "instance_type" {
    default = "t2.micro"
  }

variable "key_name" {
   default = "ohio"
}       
                      
variable "associate_public_ip_address"  {
    type = bool
    description = "(optional) describe your variable"
    default =  true
} 
 variable "instance_count"  {
    type = number
    description = "(optional) describe your variable"
    default = 3
 }  

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 443,  8080, 8081]
}

variable "az" {
  default = "us-east-2c"
}

variable "ebs_size" {
  default = 8
}