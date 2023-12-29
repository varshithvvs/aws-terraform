# ============================================================================
# Variables
# ============================================================================

# Define variables for remote backend setup
variable "s3_bucket_name" {
  description = "The name of the S3 bucket to store the Terraform state file. Must be unique in this AWS account."
  type        = string
}

variable "dynamo_db_table_name" {
  description = "The name of the DynamoDB table to use for Terraform state locking. Must be unique in this AWS account."
  type        = string
}

variable "aws_region" {
  type        = string
  description = "AWS region where resources are needed"
  default     = "ap-south-1"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be attached to the AWS resources"
  default = {
    Project = "GitHub-Playground"
  }
}


# ============================================================================
# Creates resources for remote backend
# Purpose: Creates a remote backend for the terraform state file
# This module creates a remote backend for the terraform state file
# This is used to store the state file in a remote location
# It creates a S3 bucket and a DynamoDB table to store the state file
# Module: modules/remote_backend_setup
# ============================================================================

# Import remote_backend from the folder modules/remote_backend

module "remote_backend" {
  source               = "../../modules/remote_backend"
  aws_region           = var.aws_region
  default_tags         = var.default_tags
  s3_bucket_name       = var.s3_bucket_name
  dynamo_db_table_name = var.dynamo_db_table_name
}


# ============================================================================
# Outputs
# ============================================================================

# Output the ARN of the S3 bucket created by the remote backend module
output "s3_bucket_arn" {
  value       = module.remote_backend.s3_bucket_arn
  description = "The ARN of the S3 bucket"
}

# Output the name of the DynamoDB table created by the remote backend module
output "dynamodb_table_name" {
  value       = module.remote_backend.dynamodb_table_name
  description = "The name of the DynamoDB table"
}
