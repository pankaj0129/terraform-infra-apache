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
  default     = "apache_vpc"
}