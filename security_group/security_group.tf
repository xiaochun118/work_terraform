resource "aws_security_group" "default" {
    name = var.security_group_name
    ingress {
        from_port = var.ingress_from_port
        to_port = var.ingress_to_port
        protocol = var.ingress_protocol
        cidr_blocks = var.ingress_cidr_blocks
    }
    egress {
        from_port = var.egress_from_port
        to_port = var.egress_to_port
        protocol = var.egress_protocol
        cidr_blocks = var.egress_cidr_blocks
    }
}

variable "security_group_name" {}
variable "ingress_from_port" {}
variable "ingress_to_port" {}
variable "ingress_protocol" {}
variable "ingress_cidr_blocks" {}
variable "egress_from_port" {}
variable "egress_to_port" {}
variable "egress_protocol" {}
variable "egress_cidr_blocks" {}

