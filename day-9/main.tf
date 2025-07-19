provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {
    for_each = var.instance_name_val
    ami = var.instance_ami_val
    instance_type =  var.instance_type_val

    tags = {
      "Name" = each.key
    }

}