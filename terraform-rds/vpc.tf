resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.dns_hostnames
  enable_dns_support   = var.dns_support

  tags = merge(local.common_tags, {
    Name = "${var.vpc_name}"
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.vpc_pub_subnets)
  cidr_block              = var.vpc_pub_subnets[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = var.map_public

  tags = merge(local.common_tags, {
    Name = "${var.pub_name}-${count.index + 1}"
  })
}

resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.vpc_priv_subnets)
  cidr_block        = var.vpc_priv_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(local.common_tags, {
    Name = "${var.priv_name}-${count.index + 1}"
  })
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.rtb_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.common_tags, {
    Name = "${var.rtb_name}-public-rtb"
  })
}

resource "aws_route_table_association" "pub_associate" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.rtb.id
}