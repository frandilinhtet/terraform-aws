terraform {
  backend "s3" {
    region  = "ap-southeast-1"
    bucket  = "demo-uat-terra-state"
    key     = "rds/terraform.tfstate"
    encrypt = true
  }
}