terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=0.13"
    }
#   backend "s3" { 
#     region = "ap-south-1" 
#     dynamodb_table = "lockid-table" 
#     key = "terraform.tfstate" 
#     bucket = "tfstatefile-store" 
#     skip_credentials_validation = true
#   } 
  }
}
provider "aws" {
  shared_credentials_file = "C:\\Users\\sakshi.paradkar\\.aws\\credentials"
  profile                  = "default"
  assume_role {
    role_arn     = "arn:aws:sts::798092881332:assumed-role/codebuild-terraform_build-service-role/AWSCodeBuild-1605a7bf-c7a0-4d13-8b8c-7f7ff7c2ce5c"
    session_name= "terraform"
  }
  region = "ap-south-1"
}
# terraform { 
# required_version= ">=0.13" 
# backend "s3" { 
#   region = "ap-south-1" 
#   dynamodb_table = "lockid-table" 
#   key = "terraform.tfstate" 
#   bucket = "tfstatefile-store" 
#   skip_credentials_validation = true
#   } 

# } 

resource "aws_s3_bucket" "test" {
  bucket = "my-test-s3-terraform-bucket-new"
  acl = "private"
  versioning {
    enabled = true
  }
}

