#pub
resource "aws_subnet" "public-subnet" {
  vpc_id     = var.pub_sub_vpc
  cidr_block = var.public_sub_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.av_zone_pub
  tags = {
    Name = var.pub_sub_tags
  }
}
#private
resource "aws_subnet" "private-subnet" {
  count = length(var.private_subnet_cidr)
  vpc_id     = var.private_sub_vpc
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone  = var.av_zone_pri[count.index]
  tags = {
    Name = var.pvt_subnet_tag[count.index]
  }
}