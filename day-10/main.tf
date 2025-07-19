provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "test" {
  ami = var.instance_ami_val
  key_name = var.instance_key_val
  instance_type = var.instance_type_val
  vpc_security_group_ids = ["sg-069cef26a14171cda"]
  provisioner "file" {
    source =  "C:\\Users\\kumara41\\OneDrive - Reed Elsevier Group ICO Reed Elsevier Inc\\Documents\\hackerank\\terrraformfiles\\binary.pem"
    destination = "/tmp/binary.pem"
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = file("C:/Users/kumara41/OneDrive - Reed Elsevier Group ICO Reed Elsevier Inc/Documents/hackerank/terrraformfiles/binary.pem")
    timeout = "4m"
  }
}

