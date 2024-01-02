/**
 * Outputs for the remote backend module.
 */

output "s3_bucket_arn" {
  value       = aws_s3_bucket.state_file.arn
  description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.state_lock.name
  description = "The name of the DynamoDB table"
}