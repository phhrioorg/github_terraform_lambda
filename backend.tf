terraform {
  backend "s3" {
#    bucket = "phh-tf-state-bucket"
#    key    = "aws_dynamodb_table.hash_key"
    key            = "PSA_state_files/cohort/accounts/tfstate"
    region         = "eu-west-2"
    dynamodb_table = "iphh-tf-state-lock"
    encrypt        = true
  }
}

#data "terraform_remote_state" "network" {
#  backend = "s3"
#  config = {
#    bucket = "${var.csp_tf_s3_bucket}"
#    key = "${var.csp_tf_state_key}"
#    region = "${var.csp_region}"
#  }
#}

