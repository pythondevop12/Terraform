output "instace_public_ips" {
    description = "this will give the output of all the instances public ip value"
    value = [for instance in aws_instance.test: instance.public_ip]
}
output "instace_id" {
    description = "this will give the output of all the instances public ip value"
    value = [for instance in aws_instance.test: instance.id]
}