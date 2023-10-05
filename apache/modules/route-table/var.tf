variable "public_vpc_rtb" {
  description = "public_vpc_rtb"
}
variable "pub_rtb" {
  description = "route table name"
  type        = string
  default     = "public-rtb"
}
variable "pub_rtb_route" {
  description = "routes"
  type        = string
  default     = "0.0.0.0/0"
}
variable "igw_gateway" {
  description = "igw_gateway"
}
variable "pub_subnet_id" {
  type = string
  description = "pub_subnet_id"
}
############## subnet association pvt ###############

variable "nat_id" {
  default     = ""
  description = "description"
}

variable "private_route_table_tag" {
  default     = ""
  description = "description"
}

variable "pri_subnet_id" {
  type      = list(string)
  description = "description"
}



