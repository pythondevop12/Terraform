provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "tf-locs"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "dynamo-db-s3-test"
    Environment = "Test"
    Description = "It is for manage state file"
  }
}


