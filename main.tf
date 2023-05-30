# provider "aws:3.7.1" {
#   region = "ap-south-1"
# }
provider "aws" {
  access_key = jsondecode(file("aws_credentials.json"))["Access_Key"]
  secret_key = jsondecode(file("aws_credentials.json"))["Secret_Access_Key"]
  region     = jsondecode(file("aws_credentials.json"))["Region"]
}
terraform { 
required_version= ">=0.13" 
backend "s3" { 
  region = "ap-south-1" 
  dynamodb_table = "statefiletable" 
  key = "terraform.tfstate" 
  bucket = "newstatefile" 
  skip_credentials_validation = true
  } 

} 

resource "aws_s3_bucket" "test" {
  bucket = "my-test-s3-terraform-bucket-new"
  acl = "private"
  versioning {
    enabled = true
  }
}

