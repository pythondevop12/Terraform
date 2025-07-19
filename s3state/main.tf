resource "aws_s3_bucket" "statefile" {
    bucket = "dynos3test"
    lifecycle {
      prevent_destroy = true
    }
    tags = {
      Name = "dynamo-db-s3-test"
      Environment = "Test"
      Description = "It is for manage state file"
    }
  
}

resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.statefile.id
  versioning_configuration {
    status = "Enabled"
  }
}