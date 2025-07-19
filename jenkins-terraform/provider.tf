terraform {
    required_version = ">= 1.8.4"
    required_providers {
      aws = {
        source = "harshicorp/aws"
        version = "~> 6.4.0"
      }
    }

    backend "s3" {
        bucket = "dynos3test"
        key = "key/terraform.tfstate"
        dynamodb_table = "tf-locs"
        encrypt = true
        region = "us-eat-1"
      
    }
}

provider "aws" {
    region = "us-east-1"
  
}
