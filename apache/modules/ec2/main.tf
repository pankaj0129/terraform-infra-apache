data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "bastion_server" {
    ami           = "ami-0e77d49065decd4ac"
    instance_type = var.bastion_instance_type
    subnet_id = var.bastion_subnet_id
    key_name = var.key_name
    vpc_security_group_ids = [var.bastion_sg_id]

  tags = {
    Name = var.bastion_tags

}
}

resource "aws_instance" "apache_server" {
    ami           = data.aws_ami.ubuntu.id
    count = length(var.apache_server_tags)
    instance_type = var.apache_instance_type
    subnet_id = var.apache_subnet_id[count.index]
    key_name = var.key_name
    vpc_security_group_ids = [var.apache_sg_id]

  tags = {
    Name = var.apache_server_tags[count.index]

}
}
