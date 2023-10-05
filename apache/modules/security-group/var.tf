variable "bastion_vpc_id" {
   description = "specify the vpc id here"
   type = string
}
variable "bastion_sg_name" {
   description = "specify the security group name here"
   type = string
}
variable "inbound_ports" {
   description = "specify the inbound ports here"
   type = list (string)
}
variable "ingr_protocol" {
   description = "specify the ingress protocol here"
   type = string
}
variable "ingr_cidr_block" {
   description = "specify the ingress cidr block here"
   type = list (string)
}
variable "apache_vpc_id" {
   description = "specify the security group name here"
   type = string
}

variable "apache_sg_name" {
   description = "specify the security group name here"
   type = string
}
variable "apache_inbound_ports" {
   description = "specify the inbound ports here"
   type = list(string)
}
variable "apache_ingr_protocol" {
   description = "specify the ingress protocol here"
   type = string
}
variable "apache_ingr_cidr_block" {
   description = "specify the ingress cidr block here"
   type = list(string)
}

