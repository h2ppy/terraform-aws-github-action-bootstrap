provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "h2ppy-terraform-state-dev-env"
    key = "default-infrastructure"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "h2ppy-terraform-state-dev-env"

  versioning {
    enabled = true
  }
}
