terraform {
  backend "s3" {
    region = "ap-southeast-1"
    bucket = "demo-uat-terra-state"
    key = "s3/terraform.tfstate"
    encrypt = true
  }
}