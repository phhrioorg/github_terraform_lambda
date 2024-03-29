output "state_bucket" {
  description = "The S3 bucket to store the remote state file."
  value       = aws_s3_bucket.state
}

output "dynamodb_table" {
  description = "The DynamoDB table to manage lock states."
  value       = aws_dynamodb_table.terraform_locks.name
}

output "terraform_iam_policy" {
  description = "The IAM Policy to access remote state environment."
  value       = aws_iam_policy.terraform
}
