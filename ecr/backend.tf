terraform {
  backend "s3" {
    bucket         = "phh-copps-tf-b"
    key            = "phh-ecr"
    region         = "eu-west-2"
    dynamodb_table = "uk-copps-tf-ddb"
    encrypt        = true
  }
}


