terraform {
  backend "s3" {
    bucket = "testhandsoncicd"
    key    = "handons/gitlab/api-gateway/terraform.tfstates"
    region = "eu-west-1"
  }
}

