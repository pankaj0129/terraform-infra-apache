cidr_block                 = "10.0.0.0/18"
instance_tenancy           = "default"
tags                       = "apache_vpc"
public_sub_cidr            = "10.0.1.0/24"
pub_sub_tags               = "apache_public_subnet"
av_zone_pub                = "ap-south-1a"
private_subnet_cidr        = ["10.0.2.0/24", "10.0.3.0/24"]
pvt_subnet_tag             = ["apache2-sub-01", "apache2-sub-02", ]
av_zone_pri                = ["ap-south-1b", "ap-south-1c"]
igw                        = "apache_igw"
pub_rtb                    = "apache-public-rtb"
pub_rtb_route              = "0.0.0.0/0"
eip_tag                    = "es-eip"
nat_tag                    = "es-nat"
bastion_instance_type      = "t3.medium"
bastion_tags               = "bastion_server"
key_name                   = "Ansible_key"
apache_instance_type      = "t3.medium"
apache_server_tags        = ["apache_server-1", "apache_server-2"]
bastion_sg_name  = "bastion_sg"
inbound_ports   = ["22", "80", "8080"]
ingr_protocol   = "tcp"
ingr_cidr_block = ["0.0.0.0/0", "0.0.0.0/0"]
apache_sg_name         = "apache_sg"
apache_inbound_ports   = ["22", "80"]
apache_ingr_protocol   = "tcp"
apache_ingr_cidr_block = ["0.0.0.0/0", "0.0.0.0/0"]


