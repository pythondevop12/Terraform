terraform {
  backend "s3" {
    bucket         = "dynos3test"
    key            = "key/terraform.tfstate"
    encrypt        = true
    region         = "us-east-1"
    dynamodb_table = "tf-locs"
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_iam_role" "lambda_role" {
  name = "tf-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "cloudwatch_logs_policy" {
  name        = "tf-lambda-cloudwatch-logs-policy"
  description = "Allows Lambda to write logs to CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}


resource "aws_iam_policy_attachment" "lambda_logs_attach" {
  name       = "tf-lambda-logs-attachment"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = aws_iam_policy.cloudwatch_logs_policy.arn
}

data "archive_file" "zip_py_code" {
    type = "zip"
    source_dir = "${path.module}/python/"
    output_path = "${path.module}/python/hello-python.zip"
  
}


resource "aws_lambda_function" "Tflambda_func" {
    filename = "${path.module}/python/hello-python.zip"
    function_name = "lambdafunc"
    role = aws_iam_role.lambda_role.arn
    handler = "hello-python.lambda_handler"
    runtime = "python3.9"
    depends_on = [ aws_iam_policy_attachment.lambda_logs_attach ]
  
}


output "terraform_role_op" {
    value = aws_iam_role.lambda_role.name
  
}