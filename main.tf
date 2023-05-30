# provider "aws:3.7.1" {
#   region = "ap-south-1"
# }
terraform {
  # Can be removed when bug is resolved: https://github.com/hashicorp/terraform-provider-aws/issues/23110
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::798092881332:role/service-role/AWSCodePipelineServiceRole-ap-south-1-terraform_pipeline"
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

