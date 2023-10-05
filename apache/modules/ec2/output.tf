output "ubuntu_ami" {
    value = data.aws_ami.ubuntu
}
output "bastion_server_id" {
    value = aws_instance.bastion_server.id
}
output "apache_instance_id" {
    value = aws_instance.apache_server[*].id
}
