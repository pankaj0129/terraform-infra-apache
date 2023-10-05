output "bastion_sg_id" {
    value = aws_security_group.sg_bastion.id
}
output "apache_sg_id" {
    value = aws_security_group.sg_apache.id
}


