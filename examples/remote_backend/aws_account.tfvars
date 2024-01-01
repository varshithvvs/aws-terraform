# This file contains the Terraform variables for setting up the remote backend in the dev account.
# It specifies the S3 bucket name, DynamoDB table name, AWS region, and default tags for the Terraform state.

s3_bucket_name       = "terraform-remote-playground"
dynamo_db_table_name = "terraform-state-lock"
aws_region           = "ap-south-1"
default_tags = {
  "Project" = "GitHub-Playground"
}