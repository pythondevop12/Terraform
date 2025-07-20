resource "aws_s3_bucket" "bucket" {
  bucket = "${terraform.workspace}-${var.bucket_name_val}"

  tags = {
    Name        = "${terraform.workspace}-Jenkins-buckett",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }
}
