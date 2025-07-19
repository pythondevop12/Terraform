resource "aws_instance" "example" {
    ami = var.ami_value
    key_name = var.key_name_value
    instance_type = var.instance_type_value
}

