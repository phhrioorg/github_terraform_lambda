#
# This will move the terraform state file to S3://uk-copps-tf-b/Initial;
#
# This will create the LockID "uk-copps-tf-b/Initial-md5" in the "uk-copps-tf-ddb" DyanmoDB table. 
#
terraform {
  backend "s3" {
    bucket = "phh-copps-tf-b"
    key    = "Initial"
    dynamodb_table = "uk-copps-tf-ddb"
    encrypt        = true
    region = "eu-west-2"
  }
}


