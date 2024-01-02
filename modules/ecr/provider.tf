/**
 * Provider configuration for AWS ECR.
 * 
 * This file defines the provider block for the AWS ECR module.
 * It specifies the AWS region and default tags to be used.
 */
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}