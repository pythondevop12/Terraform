terraform {
  backend "s3" {
    bucket         = "dynos3test"
    key            = "key/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-locs"
  }
}
provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "test" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-077f2681f5ffa8029"]

}
