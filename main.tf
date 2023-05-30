# provider "aws:3.7.1" {
#   region = "ap-south-1"
# }
provider "aws" {
#   access_key = jsondecode(file("aws_credentials.json"))["Access_Key"]
#   secret_key = jsondecode(file("aws_credentials.json"))["Secret_Access_Key"]
#   region     = jsondecode(file("aws_credentials.json"))["Region"]
}
terraform { 
required_version= ">=0.13" 
backend "s3" { 
  region = "ap-south-1" 
  dynamodb_table = "terraform-state-locking-db" 
  key = "terraform.tfstate" 
  bucket = "terraform-statefile-store" 
  skip_credentials_validation = true
  } 

} 

#.... s3 bucket for terraform state

resource "aws_s3_bucket" "tf_remote_statefile" {
  bucket = "terraform-statefile-store"
  region= "ap-south-1"
  acl= "private"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}

#.... DynamoDB for locking the state file

resource "aws_dynamodb_table" "tf_state_locking" {
  hash_key = "LockID"
  name     = "terraform-state-locking-db"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}
resource "aws_s3_bucket" "test" {
  bucket = "my-test-s3-terraform-bucket-new"
 
  acl = "private"
  versioning {
    enabled = true
  }
}

