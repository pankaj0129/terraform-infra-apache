################ VPC ###########################
variable "cidr_block" {
  description = "specify cidr block for vpc"
  type        = string
  default     = "10.0.0.0/18"
}
variable "instance_tenancy" {
  description = "specify tenancy"
  type        = string
  default     = "default"
}
variable "tags" {
  description = "specify name"
  type        = string
  default     = "grafana_vpc"
}
#######################################################
#--------public subnet ----------#
variable "pub_sub_vpc" {
  description = "specify cidr block for vpc"
  type        = string
  default     = "10.0.0.0/23"
}

variable "pub_sub_tags" {
  description = "specify tag"
  type        = string
  default     = "ninja-pub-sub-01"
}
variable "av_zone_pub" {
  default     = ""
  type        = string
  description = "description"
}
variable "public_sub_cidr" {
  description = "specify cidr block for vpc"
  type        = string
  default     = "10.0.1.0/24"
}

#--------------pvt-subnet------#
variable "private_subnet_cidr" {
  description = "specify cidr block for vpc"
  type        = list(string)
  default     = ["10.0.4.0/23", "10.0.6.0/23"]
}
variable "pvt_subnet_tag" {
  description = "specify tag"
  type        = list(string)
  default     = ["ninja-priv-sub-01", "ninja-priv-sub-02"]
}
variable "av_zone_pri" {
  type        = list(string)
  description = "description"
}
##########igw#########
variable "igw" {
  description = "specify tag"
  type        = string
  default     = "igw-1"
}
variable "vpc_igw" {
  description = "specify tag"
  default     = "vpc_igw"
}
##############rtb############
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
  default     = "igw_gateway"
}
############### nat-gateway ##############################
variable "nat_id" {
  default     = ""
  description = "description"
}

variable "private_route_table_tag" {
  default     = ""
  description = "description"
}

variable "eip_tag" {
  description = "description"
}


variable "nat_tag" {
  description = "description"
}
######################EC2 ###############################
variable "bastion_instance_type" {
  description = "specify the bastion instance type here"
  type        = string
}
variable "bastion_tags" {
  description = "specify the bastion instance tag here"
  type        = string
}
variable "bastion_subnet_id" {
  description = "specify public subnet id here"
  type        = string
  default     = "bastion"
}
variable "key_name" {
  description = "specify key name here"
  type        = string
  default     = "Ansible_key"
}
variable "apache_instance_type" {
  description = "specify grafana instance type here"
  type        = string
  default     = "t2-micro"
}
variable "apache_subnet_id" {
  description = "specify apache subnet id here"
  type        = list(string)
  default     = ["apache_subnet"]
}
variable "apache_server_tags" {
  description = "specify apache server tags here"
  type        = list(string)
}
variable "apache_sg_id" {
  description = "specify apache security group id here"
  type        = string
  default     = "apache_sg_id"
}


############################ security group ##########################

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

