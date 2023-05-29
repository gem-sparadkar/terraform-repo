# provider "aws:3.7.1" {
#   region = "ap-south-1"
# }
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.7.1"
    }
  }
}
resource "aws_s3_bucket" "test" {
  bucket = "my-test-s3-terraform-bucket"
  acl = "private"
  versioning {
    enabled = true
  }
}
