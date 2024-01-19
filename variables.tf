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

# AFTER ECR
variable "ecr_name" {
  description = "The list of ECR names to create" 
  type = list(string)
  default = null
}
variable "image_mutability" {
  description = "Image mutability on or off" 
  type = string
  default = "MUTABLE"
}
variable "encrypt_type" {
  description = "Encryption type" 
  type = string
  default = "KMS"
}
variable "tags" {
  description = "tag mapping" 
  type = map(string)
  default = {}
}
