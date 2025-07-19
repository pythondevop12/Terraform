variable "instance_type_val" {
    description = "the value is used for instance type"
  
}

variable "instance_ami_val" {
    description = "the value is used for instance ami"
  
}
variable "instance_name_val" {
    description = "the value is used for instance name"
    type = set(string)
    default = [ "dev","cert","prod" ]
  
}

