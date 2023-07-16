provider "aws" {
  region = "ap-northeast-1"
}

module "security_group"{
    source = "./security_group"
    security_group_name = "example"
    ingress_from_port   = 80
    ingress_to_port     = 80
    ingress_protocol    = "tcp"
    ingress_cidr_blocks = ["0.0.0.0/0"]
    egress_from_port    = 0
    egress_to_port      = 0
    egress_protocol     = "-1"
    egress_cidr_blocks  = ["0.0.0.0/0"]
}

module "ec2" {
    source = "./ec2"
    ami                    = "ami-0d3bbfd074edd7acb"
    instance_type          = "t2.micro"
    security_group_ids     = ["module.security_group.security_group_id"]
    user_data = <<EOF
       #!/bin/bash
       yu install -y httpd
       systemctl start httpd.service
      EOF
    tags_Name = "example"
}

output "public_dns" {
    value =module.ec2.public_dns
}