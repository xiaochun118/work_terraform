 resource "aws_instance" "default" {
    ami                    = var.ami
    instance_type          = var.instance_type
    vpc_security_group_ids = var.security_group_ids
    user_data = var.user_data
    tags                   = {
      Name = var.tags_Name
    }
 }

    variable "instance_type" {}
    variable "ami" {}
    variable "security_group_ids" {}
    variable "user_data" {}
    variable "tags_Name" {}

    output "public_dns" {
    value = aws_instance.default.public_dns
}

