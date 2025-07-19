provider "aws" {
  region = "us-east-1"
}


# terraform import aws_instance.import i-044c15635ecf15045
resource "aws_instance" "import" {
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  tags = {
    "env" : "prod"
  }
}