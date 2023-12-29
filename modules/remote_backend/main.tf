# ============================================================================
# S3 Bucket for Terraform State
# - S3 Bucket needs to have versioning enabled
# - S3 Bucket needs to have encryption enabled
# - S3 Bucket needs to have access logging enabled

# ============================================================================

resource "aws_s3_bucket" "state_file" {
  bucket = var.s3_bucket_name
}

# Enable S3 bucket versioning
resource "aws_s3_bucket_versioning" "state_file" {
  bucket = aws_s3_bucket.state_file.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.state_file.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Explicitly block all public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.state_file.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}



# ============================================================================
# DynamoDB Table for State Locking
# ============================================================================

# Create a KMS key for encrypting the DynamoDB table with rotating key
resource "aws_kms_key" "dynamodb" {
  description             = "KMS key for Terraform IaC DynamoDB state locking"
  deletion_window_in_days = 10
  is_enabled              = true
  enable_key_rotation     = true
}

# Create an alias for the KMS key
resource "aws_kms_alias" "dynamodb" {
  name          = "alias/${var.dynamo_db_table_name}"
  target_key_id = aws_kms_key.dynamodb.key_id
}

# Create a DynamoDB table for state locking and consistency checking
resource "aws_dynamodb_table" "state_lock" {
  name         = var.dynamo_db_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  # Enable server-side encryption, Ensure DynamoDB Tables are encrypted using a KMS Customer Managed CMK
  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_alias.dynamodb.target_key_arn
  }

  # Enable point-in-time recovery, Ensure Dynamodb point in time recovery (backup) is enabled
  point_in_time_recovery {
    enabled = true
  }
}