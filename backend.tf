data "terraform_remote_state" "master_state" {
  backend = "s3"
  config = {
    bucket = "${var.csp_tf_s3_bucket}"
    key = "${var.csp_tf_state_key}"
    region = "${var.csp_region}"
  }
}
