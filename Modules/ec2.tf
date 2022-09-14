locals {
  common_tags = {
    Team = "DevOps Team"
    service = "backend"
  }

  name = join("-",var.instance_name)
}

resource "aws_instance" "app-dev" {
   ami = var.ami
   instance_type = var.instance_type
   key_name = var.key_name
   tags = local.common_tags
  associate_public_ip_address = var.associate_public_ip_address
  count                       = var.instance_count
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = var.az
  size              = var.ebs_size
  tags = local.common_tags
}


resource "aws_instance" "webinstance" {
   ami = var.ami
   instance_type = var.instance_type
   key_name = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  count                       = var.instance_count
  tags = {
    Name = "WebApplication-${var.instance_name[count.index]}"
  }
}

  
## terraform import aws_instace.webinstance instance_id

