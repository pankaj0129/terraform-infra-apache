resource "aws_security_group" "sg_bastion" {
  vpc_id      = var.bastion_vpc_id
  name        = var.bastion_sg_name
  dynamic "ingress" {
    for_each = var.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.ingr_protocol
      cidr_blocks = var.ingr_cidr_block
    }
  }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_apache" {
  vpc_id      = var.apache_vpc_id
  name        = var.apache_sg_name

  dynamic "ingress" {
    for_each = var.apache_inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.apache_ingr_protocol
      cidr_blocks = var.apache_ingr_cidr_block
    }
  }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

