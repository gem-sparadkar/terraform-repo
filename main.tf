# provider "aws:3.7.1" {
#   region = "ap-south-1"
# }
provider "aws" {
  access_key = jsondecode(file("aws_credentials.json"))["Access_Key"]
  secret_key = jsondecode(file("aws_credentials.json"))["Secret_Access_Key"]
  region     = jsondecode(file("aws_credentials.json"))["Region"]
}

resource "aws_s3_bucket" "test" {
  bucket = "my-test-s3-terraform-bucket"
  acl = "private"
  versioning {
    enabled = true
  }
}
