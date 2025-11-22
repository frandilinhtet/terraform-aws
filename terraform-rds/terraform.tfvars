vpc_name = "efficient"

cidr_block = "192.168.0.0/16"

instance_tenancy = "default"

dns_hostnames = "true"

dns_support = "true"

pub_name = "efficient-public-subnet"

vpc_pub_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]

priv_name = "efficient-private-subnet"

vpc_priv_subnets = ["192.168.11.0/24", "192.168.12.0/24", "192.168.13.0/24"]

azs = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]

map_public = "true"

rtb_cidr = "0.0.0.0/0"

rtb_name = "efficient"

db_subnet_name = "demo-rds-private-subnet"

db_engine = "mysql"

db_engine_version = "8.4.5"

class = "db.t4g.micro"

name = "demomysqlrds"

encrypt = "true"

storage = "20"

rds_sec = "demo-rds-sg"

type = "gp3"

multi = "false"

public = "false"

skip = "true"

final = "false"

user = "admin"

pass = "DBadmin123"

image = "ami-014533a88507df1ae"

instance = "t3.micro"

assocaite = "true"

bastion_sec = "demo-bastion-sg"

instance_name = "demo-bastion-host"