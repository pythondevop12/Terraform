provider "aws" {
  region = "us-east-1"
}

locals {
  ingress_rules = [
    {
      port        = 443
      description = "it is used for port ssl"
    },
    {
      port        = 80
      description = "it is used for http port"
    },
    {
      port        = 22
      description = "it is used for ssh"
    },
  ]
}


resource "aws_instance" "test" {
    ami = "ami-020cba7c55df1f615"
    instance_type = "t2.micro"
    key_name = "mytest"
    vpc_security_group_ids = [aws_security_group.main.id]
}


resource "aws_security_group" "main" {
    egress = [{
        description = "all traffic"
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        from_port = 0
        to_port = 0    
        ipv6_cidr_blocks = []
        prefix_list_ids = []    
        self = false
        security_groups = []
    }
    ]

    dynamic "ingress" {
        for_each =  local.ingress_rules
        content {
          description = ingress.value.description
          from_port = ingress.value.port
          to_port = ingress.value.port
          protocol = "tcp"
          cidr_blocks      = ["0.0.0.0/0"]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
          self = false

        }
    }

}


# resource ""key_name "mytest" {

  
# }