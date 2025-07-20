output "aws_iam_role_arn" {
    value = aws_iam_role.ec2iam.arn
  
}

output "instance_profile_name" {
    value = aws_iam_instance_profile.jenkins_ec2_profile.name
  
}

