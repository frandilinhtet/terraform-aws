variable "project" {
  description = "Project name tagging"
  type        = string
}

variable "environment" {
  description = "environment name"
  type        = string
}

variable "cidr_block" {
  description = "vpc cidr range"
  type        = string
}

variable "instance_tenancy" {
  description = "vpc's tenancy"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "azs" {
  description = "vpc availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "rtb_cidr" {
  description = "CIDR block for routing to internet"
  type        = string
}