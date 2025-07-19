output "instance_public_ips" {
  value = {
    for name, instance in aws_instance.test :
    name => instance.public_ip
  }
}

output "instance_ids" {
  value = {
    for name, instance in aws_instance.test :
    name => instance.id
  }
}
