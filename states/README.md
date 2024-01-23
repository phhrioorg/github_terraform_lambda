To configure the terraform state locking using S3 This should be run once only at the very start of the AWS infrastructre builds.

This file will:

A) Create an S3 bucket with versioning and encryption enabled called psa-cohort-state-file

B) Create a dynamodb table called csp-tf-state-state-lock to hold the Terraform lock id.

Run the command: terraform apply 
