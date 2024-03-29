#---------------------------------------------------------------------------------------------------
# IAM Policy
# See below for permissions necessary to run Terraform.
# https://www.terraform.io/docs/backends/types/s3.html#example-configuration
#
# terragrunt users would also need additional permissions.
# https://github.com/nozaq/terraform-aws-remote-state-s3-backend/issues/74
#---------------------------------------------------------------------------------------------------

resource "aws_iam_policy" "terraform" {
  name   = var.terraform_iam_policy_name
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket", "s3:GetBucketVersioning"],
      "Resource": "${aws_s3_bucket.state.arn}"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "${aws_s3_bucket.state.arn}/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:DeleteItem",
        "dynamodb:DescribeTable"
      ],
      "Resource": "${aws_dynamodb_table.terraform_locks.arn}"
    },
    {
      "Effect": "Allow",
      "Action": [
        "kms:ListKeys"
      ],
      "Resource": "*"
    }
  ]
}
POLICY

  tags = var.tags
}
