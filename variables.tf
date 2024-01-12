variable "csp_region" {
  type    = string
  default = "eu-west-2"
}

variable "csp_tf_s3_bucket" {
  type    = string
  default = "csp-tf-state-bucket20240112"
}

variable "csp_tf_state_key" {
  type    = string
  default = "LockID"
}
