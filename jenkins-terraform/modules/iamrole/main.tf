resource "aws_iam_role" "ec2iam" {
  name = "${terraform.workspace}-role"
  assume_role_policy = jsondecode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name        = "${terraform.workspace}-ec2-iam-role",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }

}

resource "aws_iam_policy" "ec2iampolicy" {
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:GetObject",
        "s3:PutObject"]

        Sid = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Resource = "${var.s3_bucket_arn}/*"
      },
    ]
  })
  tags = {
    Name        = "${terraform.workspace}-public-RT",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }

}

resource "aws_iam_policy_attachment" "ec2policyattach" {
  name       = "${terraform.workspace}-policyattach"
  roles      = [aws_iam_role.ec2iam]
  policy_arn = aws_iam_policy.ec2iampolicy

}

resource "aws_iam_instance_profile" "jenkins_ec2_profile" {
  role = aws_iam_role.ec2iam
  name = "${terraform.workspace}-instanceprofile"
  tags = {
    Name        = "${terraform.workspace}-instanceprofile",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }

}
