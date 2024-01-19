#---------------------------------------------------------------------------------------------------
# General
#---------------------------------------------------------------------------------------------------
variable "tags" {
  description = "A mapping of tags to assign to resources."
  type        = map(string)
  default = {
    Terraform = "true",
    Name      = "csp"
  }
}
variable "csp_region" {
  type    = string
  default = "eu-west-2"
}

variable "csp_tf_s3_bucket" {
  type    = string
  default = "phh-tf-state-bucket"
}

variable "csp_tf_state_key" {
  type    = string
  default = "LockID"
}

#---------------------------------------------------------------------------------------------------
# S3 Buckets
#---------------------------------------------------------------------------------------------------

variable "state_bucket_prefix" {
  description = "Creates a unique state bucket name beginning with the specified prefix."
  type        = string
  default     = "phh-tf-state-bucket"
}

variable "iam_role_arn" {
  description = "Use IAM role of specified ARN for s3 replication instead of creating it."
  type        = string
  default     = null
}

variable "iam_role_permissions_boundary" {
  description = "Use permissions_boundary with the replication IAM role."
  type        = string
  default     = null
}

variable "s3_bucket_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from S3 buckets so that the buckets can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}

variable "s3_logging_target_bucket" {
  description = "The name of the bucket for log storage. The \"S3 log delivery group\" should have Objects-write and ACL-read permissions on the bucket."
  type        = string
  default     = null
}
variable "s3_logging_target_prefix" {
  description = "The prefix to apply on bucket logs, e.g \"logs/\"."
  type        = string
  default     = ""
}

#---------------------------------------------------------------------------------------------------
# DynamoDB Table for State Locking
#---------------------------------------------------------------------------------------------------

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table to use for state locking."
  type        = string
  default     = "phh-tf-state-lock"
}

variable "dynamodb_table_billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity."
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "dynamodb_deletion_protection_enabled" {
  description = "Whether or not to enable deletion protection on the DynamoDB table"
  type        = bool
  default     = true
}

variable "tf_s3_bucket" {
  type    = string
  default = "phh-tf-state-bucket"
  #  validation {
  #    condition     = length(var.s3_bucket_name) == 0 || length(regexall("^[a-z0-9][a-z0-9\\-.]{1,61}[a-z0-9]$", var.s3_bucket_name)) > 0
  #    error_message = "Input variable s3_bucket_name is invalid. Please refer to https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html."
  #  }
}

variable "terraform_iam_policy_name" {
  type        = string
  default     = "phh-tf-state-policy"
}
