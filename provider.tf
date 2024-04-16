provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  }
# Define your variables
variable "aws_region" {
  description = "The AWS region where S3 bucket will be created"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket to store Terraform state"
}

variable "key" {
  description = "The path to the state file within the bucket"
  default     = "terraform.tfstate"
}

# Configure the AWS provider
provider "aws" {
  region = var.aws_region
}

# Configure Terraform backend to store state in S3
terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = var.key
    region         = var.aws_region
    dynamodb_table = "terraform_locks"
  }
}
