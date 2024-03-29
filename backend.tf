terraform {
  backend "s3" {
    bucket         = "phh-copps-tf-b"
    key            = "phh-ecr"
    region         = "eu-west-2"
    dynamodb_table = "uk-copps-tf-ddb"
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

