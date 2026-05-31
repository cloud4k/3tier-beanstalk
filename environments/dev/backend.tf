terraform {
  backend "s3" {
    bucket  = "harjotscloud-shared-terraform-state"
    key     = "3tier-beanstalk/dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}