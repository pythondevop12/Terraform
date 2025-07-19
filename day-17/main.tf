provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "name" {
    ami = var.ami_val
    instance_type = var.instance_type_val
    tags = {
      Name = "Terraform EC2"
    }
  
}


data "aws_instance" "myawsinstance"{
    filter {
      name = "tag:Name"
      values = ["Terraform EC2"]
    }

    depends_on = [ "aws_instance.name" ]
}



