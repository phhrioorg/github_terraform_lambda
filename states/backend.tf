terraform {
  backend "s3" {
    bucket = "phh-tf-state-bucket"
    key    = "aws_dynamodb_table.hash_key"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
}


