provider "aws" {
    region = "us-east-1"
}

variable "ami_value" {
    description = "value for the ami"  
}

variable "instance_type_value" {
    description = "value for the instance type"
  
}

variable "subnet_id_value" {
  description = "value for the subnet"
}

resource "aws_instance" "test" {
    ami = var.ami_value
    instance_type = var.instance_type_value
    subnet_id = var.subnet_id_value  
}

output "public-ip-address" {
    value = aws_instance.test.public_ip
  
}