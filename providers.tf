/**
 * This file defines the AWS provider configuration for the Terraform project.
 * It specifies the AWS region and default tags to be applied to resources.
 */

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}