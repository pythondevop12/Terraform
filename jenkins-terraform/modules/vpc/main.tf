resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_val
    enable_dns_hostnames = true
    enable_dns_support = true
    
    tags = {
      Name = "${terraform.workspace}-vpc",
      Environment = "${terraform.workspace}"
      App = "Jenkins"
    }
}

