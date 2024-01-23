#---------------------------------------------------------------------------------------------------
# DynamoDB Table for State Locking
#---------------------------------------------------------------------------------------------------

locals {
  lock_key_id = "LockID"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name                        = var.dynamodb_table_name
  billing_mode                = var.dynamodb_table_billing_mode
  hash_key                    = local.lock_key_id
  deletion_protection_enabled = var.dynamodb_deletion_protection_enabled
  attribute {
    name = local.lock_key_id
    type = "S"
  }
  point_in_time_recovery {
    enabled = var.dynamodb_point_in_time_recovery
  }
  server_side_encryption {
    enabled     = var.dynamodb_enable_server_side_encryption
    kms_key_arn = aws_kms_key.this.arn
  }
  tags = var.tags
}
