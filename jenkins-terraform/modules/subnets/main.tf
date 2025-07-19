# this is use when you want to create vpc in one hit

# locals {
#   subnets_bits = 2
# }

# resource "aws_subnet" "private_subnet1" {
#   count      = 4
#   vpc_id = var.vpc_id_val
#   cidr_block = cidrsubnet(var.vpc_cidr_val, local.subnets_bits, count.index )
# }



locals {
  subnets_bits = 2
}

resource "aws_subnet" "public_subnet" {
  count      = 2
  vpc_id     = var.vpc_id_val
  cidr_block = cidrsubnet(var.vpc_cidr_Val, local.subnets_bits, count.index)
  tags = {
    Name        = "${terraform.workspace}-vpc",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }

}


resource "aws_subnet" "private_subnet" {
  count      = 2
  vpc_id     = var.vpc_id_val
  cidr_block = cidrsubnet(var.vpc_cidr_Val, local.subnets_bits, count.index + 2)
  tags = {
    Name        = "${terraform.workspace}-vpc",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }

}
