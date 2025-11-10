data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.remote-bucket
    key    = var.remote-key
    region = var.region
  }
}

locals {
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnets[0]
}

resource "aws_security_group" "sg" {
  name        = var.nginx-sg
  description = "This sg is use for nginx"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  # Allow SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh-cidr]
    description = "Allow ssh access from anywhere"
  }

  # Allow HTTP
  ingress {
    to_port     = 80
    from_port   = 80
    protocol    = "tcp"
    cidr_blocks = [var.http-cidr]
    description = "Allow http access from anywhere"
  }

  # Allow HTTPS
  ingress {
    to_port     = 443
    from_port   = 443
    protocol    = "tcp"
    cidr_blocks = [var.https-cidr]
    description = "Allow https access from anywhere"
  }

  # Allow all outbound traffics
  egress {
    to_port     = 0
    from_port   = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "${var.project}-sg"
    Managedby = "terraform"
  }
}

resource "aws_instance" "demo-vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = local.subnet_id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name      = var.instance_name
    Managedby = "terraform"
  }
}

