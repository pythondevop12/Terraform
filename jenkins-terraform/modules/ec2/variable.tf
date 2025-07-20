variable "ami_value" {
    description = "this is used for ami value"
      
}

variable "instance_type_val" {
  description = "instance type value"
}


variable "instance_profile_name" {
  description = "instace profile arn value"
}
variable "public_subnet_ids" {
  type = list(string)
}
