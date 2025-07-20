variable "bucket_name_val" {
  description = "Name of the S3 bucket"
  type        = string
}


variable "vpc_cidr_val" {
    description = "vpc cidr value"
  
}

variable "region" {
    description = "use for define the region value"
  
}

variable "cidr_internet_block_val" {
    description = "use for internet cidr value"
  
}

variable "ami_value" {
    description = "use for the ami value"
  
}

variable "instance_type_val" {
  description = "use for the instance type value"
}