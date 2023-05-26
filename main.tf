provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "test" {
  bucket = "my-test-s3-terraform-bucket"
  acl = "private"
  versioning {
    enabled = true
  }
}
