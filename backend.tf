terraform {
  backend "s3" {
    bucket = "csp-tf-state-bucket20240112"
    key    = "aws_dynamodb_table.hash_key"
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
