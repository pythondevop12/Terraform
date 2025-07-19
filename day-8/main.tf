provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {
    count = length(var.instance_name_value)
    ami = var.ami_value
    instance_type =  var.instance_type
    tags = {
      "Name" = var.instance_name_value[count.index]
    }
}