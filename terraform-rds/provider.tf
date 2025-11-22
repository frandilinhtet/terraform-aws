terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.1"
    }
  }
}

provider "aws" {
  profile = "devops"
  region  = "ap-southeast-1"

  default_tags {
    tags = local.common_tags
  }
}

locals {
  common_tags = {
    Project     = "demo"
    Environment = "UAT"
    Managedby   = "Terraform"
    Owner       = "DevOps Team"
  }
}