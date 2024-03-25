terraform {
  backend "s3" {
    bucket = "backend-test-terraform"
    key    = "handons/gitlab/terraform.tfstates"
    region = "eu-west-1"
  }
}

