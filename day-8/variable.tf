variable "ami_value" {
    description = "this is for ami value"
}

variable "instance_type" {
    description = "this is for instance type value"
}

variable "instance_name_value" {
    description = "this is for instance name value"
    type = list(string)
    default = ["test","dev","prod"]

}