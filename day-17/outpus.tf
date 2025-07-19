output "instance_ip" {
    value = data.aws_instance.myawsinstance.public_ip
  
}
output "instance_id_value" {
    value = data.aws_instance.myawsinstance.id
  
}