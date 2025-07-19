variable "ami_value" {
    description = "ami value" 
}

variable "instance_type_val" {
    description = "instance type value"
  
}

variable "users_val" {
  description = "List of users"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}