terraform {
  backend "s3" {
    bucket = "csp-tf-state-bucket20240112"
    key    = "aws_dynamodb_table.hash_key"
  }
}
