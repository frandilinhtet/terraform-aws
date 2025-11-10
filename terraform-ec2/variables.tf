variable "ami" {
  description = "AMI for Instance"
  type        = string
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "instance_name" {
  description = "Instance Name"
  type        = string
}

variable "region" {
  description = "Region for EC2"
  type        = string
}

variable "nginx-sg" {
  description = "Security Group Name"
  type        = string
}

variable "ssh-cidr" {
  description = "CIDR block for SSH access"
  type        = string
}

variable "http-cidr" {
  description = "CIDR block for HTTP access"
  type        = string
}

variable "https-cidr" {
  description = "CIDR block for HTTPS access"
  type        = string
}

variable "project" {
  description = "Project Name"
  type        = string
}

variable "remote-bucket" {
  description = "remote state bucket name"
  type        = string
}

variable "remote-key" {
  description = "remote state key value"
}