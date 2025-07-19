provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {
    ami = var.instance_ami_val
    instance_type = var.instance_type_val
    key_name = var.instance_key_val
    vpc_security_group_ids = ["sg-069cef26a14171cda"]

    provisioner "local-exec" {
        command = "echo This is a test > myfile.txt"
      
    }
  
}