terraform {
  backend "s3" {
    bucket = "demo-uat-terra-state"
    region = "ap-southeast-1"
    key = "ec2/terraform.tfstate"
    encrypt = true
  }
}