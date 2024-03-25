terraform {
  backend "s3" {
    bucket = "backend-gitlab-terraform"
    key    = "handons/gitlab/terraform.tfstates"
    region = "eu-west-1"
  }
}

