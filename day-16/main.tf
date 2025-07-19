provider "aws" {
    region = "us-east-1"  
}

locals {
  instance_name = "${terraform.workspace}-instance"
}

resource "aws_instance" "ec2" {
  ami = "ami-020cba7c55df1f615"
  instance_type =  var.instance_type
  tags = {
    Name = local.instance_name
  }
}