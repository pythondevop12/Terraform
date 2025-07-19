variable "vpv_id_val" {
  default = "this is use for vpc id"
}


variable "cidr_internet_block_val" {
  description = "value use for the all traffic value"

}


variable "public_subnet_ids" {
  description = "public_subnet id variable"
  type        = list(string)

}
variable "private_subnet_ids" {
  description = "private_subnet id variable"
  type        = list(string)
}

variable "region" {
  description = "use for define region value"
}