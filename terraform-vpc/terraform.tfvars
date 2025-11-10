project = "efficient"

environment = "UAT"

cidr_block = "192.168.0.0/16"

instance_tenancy = "default"

region = "ap-southeast-1"

azs = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]

public_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]

private_subnets = ["192.168.101.0/24", "192.168.102.0/24", "192.168.103.0/24"]

rtb_cidr = "0.0.0.0/0"