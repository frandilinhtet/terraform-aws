terraform {
  backend "s3" {
    bucket  = "demo-uat-terra-state"
    key     = "vpc/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}