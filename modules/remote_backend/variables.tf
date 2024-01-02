/**
 * Module Variables
 *
 * This file contains the variables used by the remote backend module.
 */

/**
 * @variable s3_bucket_name
 * The name of the S3 bucket to store the Terraform state file.
 * Must be unique in this AWS account.
 *
 * @type string
 */

/**
 * @variable dynamo_db_table_name
 * The name of the DynamoDB table to use for Terraform state locking.
 * Must be unique in this AWS account.
 *
 * @type string
 */

/**
 * @variable aws_region
 * AWS region where resources are needed.
 *
 * @type string
 */

/**
 * @variable default_tags
 * Default tags to be attached to the AWS resources.
 *
 * @type map(string)
 */
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
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be attached to the AWS resources"
}