#--------public subnet ----------#
variable "public_sub_cidr" {
  description = "specify cidr block for vpc"
  type        = string
  default = "10.0.1.0/24"
}

variable "pub_sub_tags" {
  description = "specify tag"
  type        = string
  default = "apache_subnet"
}
variable "pub_sub_vpc" {
  description = "public-subnet"
  default = "pub-subnet"
}

variable "av_zone_pub" {
  default     = "ap-south-1"
  description = "description"
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
variable "private_sub_vpc" {
  description = "specify tag"
}

variable "av_zone_pri" {
  type = list(string)
  description = "description"
}
