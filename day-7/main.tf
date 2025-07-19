provider "aws" {
    region = "us-east-1"
  
}


resource "aws_instance" "example" {
  ami = var.ami_value
  instance_type = var.instance_type_val
  tags = {
    Name = "for the user"
  }
}


resource "aws_iam_user" "myuser" {
    count = length(var.users_val)
    name = var.users_val[count.index]
}