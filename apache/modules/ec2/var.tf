variable "bastion_sg_id" {
description = "specify the bastion sg id"
default = "bastion_sg_id"
}

variable "bastion_instance_type" {
    description = "specify the bastion instance type here"
    type = string
}
variable "bastion_tags" {
    description = "specify the bastion instance tag here"
    type = string
}
variable "bastion_subnet_id" {
    description = "specify public subnet id here"
    type = string
    default = "subnet id"
}
variable "key_name" {
    description = "specify key name here"
    type = string
}

variable "apache_instance_type" {
    description = "specify apache instance type here"
    type = string
}
variable "apache_subnet_id" {
    description = "specify apache subnet id here"
    type = list(string)
}
variable "apache_server_tags" {
    description = "specify apache server name"
    type = list(string)
}
variable "apache_sg_id" {
    description = "specify apache security group id here"
    type = string
    default = "apache_id"
}
