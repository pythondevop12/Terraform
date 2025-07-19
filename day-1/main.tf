# terraform {
#   required_providers {
#     aws = {
#         source = "harshicorp/aws"
#         version = ""
#     }
#   }
# }

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "test" {
    ami = "ami-020cba7c55df1f615"
    instance_type = "t2.medium"
    key_name = "binary"
}