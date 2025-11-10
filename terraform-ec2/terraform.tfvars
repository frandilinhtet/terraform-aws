ami = "ami-0827b3068f1548bf6"

instance_type = "t3.micro"

instance_name = "demo-nginx"

region = "ap-southeast-1"

nginx-sg = "demo-nginx-sg"

ssh-cidr = "0.0.0.0/0"

http-cidr = "0.0.0.0/0"

https-cidr = "0.0.0.0/0"

project = "demo-nginx"

remote-bucket = "demo-uat-terra-state"

remote-key = "vpc/terraform.tfstate"