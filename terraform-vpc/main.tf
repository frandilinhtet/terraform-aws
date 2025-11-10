#Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = var.project
    Managedby   = "terraform"
    Environment = var.environment
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.project}-igw"
    Managedby   = "terraform"
    Environment = var.environment
  }
}

#Create Public Subnets
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.public_subnets)
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project}-public.${count.index + 1}"
    Managedby   = "terraform"
    Environment = var.environment
    Type        = "public"
  }
}

#Create Private Subnets
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.private_subnets)
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name        = "${var.project}-private.${count.index + 1}"
    Managedby   = "terraform"
    Environment = var.environment
    Type        = "private"
  }
}

#Create Public Route Table
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.rtb_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.project}-public-rtb"
    Managedby   = "terraform"
    Environment = var.environment
  }
}

#Create Public Route Table associate with Public Subnets
resource "aws_route_table_association" "public_associate" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rtb.id
}