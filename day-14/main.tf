provider "aws" {
    region = "us-east-1"  
}


module "mod-1" {
    source = "./module1"
  
}
module "mod-2"{
    source = "./module2"
  
}