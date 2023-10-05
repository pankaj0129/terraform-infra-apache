resource "aws_eip" "eip" {

  tags = {
    Name = var.eip_tag
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.subnet_id

  tags = {
    Name = var.nat_tag
  }
}
