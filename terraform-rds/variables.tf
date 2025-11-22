variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "cidr_block" {
  type        = string
  description = "CIDR range for vpc"
}

variable "instance_tenancy" {
  type        = string
  description = "Tenancy for VPC"
}

variable "dns_hostnames" {
  type        = bool
  description = "DNS hostname for VPC"
}

variable "dns_support" {
  type        = bool
  description = "DNS support for VPC"
}

variable "pub_name" {
  type        = string
  description = "Public subnet name for vpc"
}

variable "vpc_pub_subnets" {
  type        = list(string)
  description = "Public Subnets for VPC"
}

variable "priv_name" {
  type        = string
  description = "Private subnet name for vpc"
}

variable "vpc_priv_subnets" {
  type        = list(string)
  description = "Private Subnets for VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zone for VPC"
}

variable "map_public" {
  type        = bool
  description = "Map Public"
}

variable "rtb_cidr" {
  type        = string
  description = "CIDR range for route table"
}

variable "rtb_name" {
  type        = string
  description = "Route table name"
}

variable "db_subnet_name" {
  type        = string
  description = "DB subnet name for DB"
}


variable "db_engine" {
  type        = string
  description = "This is DB type"
}

variable "db_engine_version" {
  type        = string
  description = "This is DB engine version"
}

variable "class" {
  type        = string
  description = "This is DB class"
}

variable "name" {
  type        = string
  description = "This is DB name"
}

variable "encrypt" {
  type        = bool
  description = "Encryption for DB storage"
}

variable "storage" {
  type        = string
  description = "Storage size for DB"
}

variable "rds_sec" {
  type        = string
  description = "Security Group Name for bastion host"
}

variable "type" {
  type        = string
  description = "Type for DB storage"
}

variable "multi" {
  type        = bool
  description = "Multi AZ for DB"
}

variable "public" {
  type        = bool
  description = "Public access for DB"
}

variable "skip" {
  type        = bool
  description = "Taking snapshot for DB"
}

variable "final" {
  type        = bool
  description = "Taking snapshot for DB"
}

variable "user" {
  type        = string
  sensitive   = true
  description = "User name for DB"
}

variable "pass" {
  type        = string
  sensitive   = true
  description = "Password for DB"
}

variable "image" {
  type        = string
  description = "AMI for instance"
}

variable "instance" {
  type        = string
  description = "Instance type of EC2"
}

variable "assocaite" {
  type        = bool
  description = "Public IP mapping for EC2"
}

variable "bastion_sec" {
  type        = string
  description = "Security group name for bastion host"
}

variable "instance_name" {
  type        = string
  description = "EC2 instance name for bastion host"
}