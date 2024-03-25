terraform {
  backend "s3" {
    bucket = "hands-on-cicd-bucket"
    key    = "handons/api-gateway/terraform.tfstates"
    region = "eu-west-1"
  }
}

