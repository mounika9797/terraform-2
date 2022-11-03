provider "aws" {
    region = "us-east-1"
    access_key = "AKIAZZDENR5WGPN7UIHM"
    secret_key = "eVhsTgJt/WdaH3gno5MAxipyXmrnyRg2OzFmfnJY"
}

resource "aws_instance" "example-1" {

    ami = "ami-08c40ec9ead489470"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.second.id]
    key_name = "rds1.key"

    tags = {
         Name = "Instance-DB-2"
    }
}

resource "aws_security_group" "second" {
    egress = [
    {
      cidr_blocks = [ "0.0.0.0/0", ]
      description = ""
      from_port   = 0
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "-1"
      security_groups = []
      self = false
      to_port = 0

    }
    ]
    ingress = [
    {
      cidr_blocks = [ "0.0.0.0/0", ]
      description =""
      from_port = 22
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol ="tcp"
      security_groups = []
      self = false
      to_port = 22
    }
  ]
}
