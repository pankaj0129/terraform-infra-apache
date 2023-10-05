module "vpc" {
  source           = "./modules/vpc"
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  tags             = var.tags
}
module "subnet" {
  source              = "./modules/subnet"
  public_sub_cidr     = var.public_sub_cidr
  pub_sub_tags        = var.pub_sub_tags
  av_zone_pub         = var.av_zone_pub
  pub_sub_vpc         = module.vpc.vpc_id
  private_subnet_cidr = var.private_subnet_cidr
  pvt_subnet_tag      = var.pvt_subnet_tag
  av_zone_pri         = var.av_zone_pri
  private_sub_vpc     = module.vpc.vpc_id
}


module "igw-public" {
  source  = "./modules/igw-public"
  igw     = var.igw
  vpc_igw = module.vpc.vpc_id
}
module "route-table" {
  source                  = "./modules/route-table"
  pub_rtb                 = var.pub_rtb
  pub_rtb_route           = var.pub_rtb_route
  public_vpc_rtb          = module.vpc.vpc_id
  igw_gateway             = module.igw-public.aws_internet_gateway
  pub_subnet_id           = module.subnet.public_subnet_id
  nat_id                  = module.nat-gateway.nat_id
  private_route_table_tag = var.private_route_table_tag
  pri_subnet_id           = module.subnet.private_subnet_id[*]
}

module "nat-gateway" {
  source    = "./modules/nat-gateway"
  eip_tag   = var.eip_tag
  subnet_id = module.subnet.public_subnet_id
  nat_tag   = var.nat_tag
}
module "ec2" {
  source                   = "./modules/ec2"
  bastion_instance_type    = var.bastion_instance_type
  bastion_tags             = var.bastion_tags
  bastion_subnet_id        = module.subnet.public_subnet_id
  key_name                 = var.key_name
  apache_instance_type    = var.apache_instance_type
  apache_server_tags      = var.apache_server_tags
  apache_subnet_id = module.subnet.private_subnet_id
  apache_sg_id         = module.security-group.apache_sg_id
  bastion_sg_id           = module.security-group.bastion_sg_id
}

module "security-group" {
  source                     = "./modules/security-group"
  bastion_vpc_id = module.vpc.vpc_id
  bastion_sg_name            = var.bastion_sg_name
  inbound_ports              = var.inbound_ports
  ingr_protocol              = var.ingr_protocol
  ingr_cidr_block            = var.ingr_cidr_block
  apache_vpc_id             = module.vpc.vpc_id
  apache_sg_name         = var.apache_sg_name
  apache_inbound_ports   = var.apache_inbound_ports
  apache_ingr_protocol   = var.apache_ingr_protocol
  apache_ingr_cidr_block = var.apache_ingr_cidr_block

}

#ALB Creation
resource "aws_lb" "apache_alb" {
  name               = "apache-alb"
  internal           = false
  load_balancer_type = "application"
  #subnets =  [module.subnet.public_subnet_id,module.subnet.private_subnet_id]
  enable_deletion_protection = false
  enable_http2 = true

 subnets = [
    module.subnet.public_subnet_id,
    tostring(module.subnet.private_subnet_id[0]),    # Convert to string and access the first element
  ]

}



resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.apache_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.apache_target_group.arn
  }
}
resource "aws_lb_target_group" "apache_target_group" {
  name     = "apache-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id = module.vpc.vpc_id
  health_check {
     path                = "/healthcheck"
     port                = 80
     protocol            = "HTTP"
     healthy_threshold   = 2
     unhealthy_threshold = 2
     timeout             = 3
     interval            = 30
   }
}

 #Attach your private EC2 instances to the target group
resource "aws_lb_target_group_attachment" "apache_alb_tg_attach" {
  count            = 2
  target_group_arn = aws_lb_target_group.apache_target_group.arn
  target_id        = element(module.ec2.apache_instance_id, count.index)
}







