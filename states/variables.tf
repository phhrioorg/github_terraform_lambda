#---------------------------------------------------------------------------------------------------
# General
#---------------------------------------------------------------------------------------------------
variable "tags" {
  description = "A mapping of tags to assign to resources."
  type        = map(string)
  default = {
    Terraform = "true",
    Name      = "uk-copps"
  }
}
variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

#---------------------------------------------------------------------------------------------------
# S3 Buckets
#---------------------------------------------------------------------------------------------------


variable "tf_s3_bucket" {
  type    = string
  default = "phh-copps-tf-b"
  #  validation {
  #    condition     = length(var.s3_bucket_name) == 0 || length(regexall("^[a-z0-9][a-z0-9\\-.]{1,61}[a-z0-9]$", var.s3_bucket_name)) > 0
  #    error_message = "Input variable s3_bucket_name is invalid. Please refer to https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html."
  #  }
}

variable "s3_logging_target_bucket" {
  description = "The name of the bucket for log storage. The \"S3 log delivery group\" should have Objects-write and ACL-read permissions on the bucket."
  type        = string
  default     = "phh-copps-tf-logs"
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
  default     = "uk-copps-tf-ddb"
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

variable "dynamodb_enable_server_side_encryption" {
  description = "Whether or not to enable encryption at rest usingf an AWS managed KMS customer key"
  type        = bool
  default     = true
}

variable "terraform_iam_policy_name" {
  type    = string
  default = "uk-copps-tf-policy"
}

variable "dynamodb_point_in_time_recovery" {
  type    = bool
  default = true
}

#---------------------------------------------------------------------------------------------------
# KMS Key for Encrypting S3 Buckets
#---------------------------------------------------------------------------------------------------

variable "kms_key_alias" {
  description = "The alias for the KMS key as viewed in AWS console. It will be automatically prefixed with `alias/`"
  type        = string
  default     = "uk-copps-tf-key"
}

variable "kms_key_description" {
  description = "The description of the key as viewed in AWS console."
  type        = string
  default     = "The key used to encrypt the uk-copps tf remote state bucket."
}

variable "kms_key_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days."
  type        = number
  default     = 30
}

variable "kms_key_enable_key_rotation" {
  description = "Specifies whether key rotation is enabled."
  type        = bool
  default     = true
}
