provider "aws" {
  region     = "${var.aws_region}"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state-tls"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = false
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-tls"
    key    = "exercice1.tfstate"
    region = "eu-west-3"
  }
}
