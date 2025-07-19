output "public_subnet_ids" {
    value = aws_subnet.public_subnet[*].id
  
}
output "public_subnet_arns" {
    value = aws_subnet.public_subnet[*].arn
  
}
output "private_subnet_ids" {
    value = aws_subnet.private_subnet[*].id
  
}

output "private_subnet_arns" {
    value = aws_subnet.private_subnet[*].arn
  
}