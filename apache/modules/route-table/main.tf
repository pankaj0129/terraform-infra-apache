resource "aws_route_table" "public_rtb" {
  vpc_id = var.public_vpc_rtb
  route {
    cidr_block = var.pub_rtb_route
    gateway_id = var.igw_gateway
  }
  tags = {
    Name = var.pub_rtb
  }
}

 resource "aws_route_table_association" "public_rtb" {
   subnet_id      = var.pub_subnet_id
   route_table_id = aws_route_table.public_rtb.id
}
resource "aws_route_table" "private_route_table" {
  vpc_id = var.public_vpc_rtb

  route {
    cidr_block = var.pub_rtb_route
    gateway_id = var.nat_id
  }

  tags = {
    Name = var.private_route_table_tag
  }
}
resource "aws_route_table_association" "private_route_table" {
    count = length(var.pri_subnet_id)
  subnet_id      = var.pri_subnet_id[count.index]
  route_table_id = aws_route_table.private_route_table.id
}


