output "aws_route_table" {
  value = aws_route_table.public_rtb.id
}
output "private_route_table_id" {
    value = aws_route_table.private_route_table.id
}
