output "instance_ip" {
    value = aws_instance.test.public_ip 
}
output "instance_id" {
    value = aws_instance.test.id 
}