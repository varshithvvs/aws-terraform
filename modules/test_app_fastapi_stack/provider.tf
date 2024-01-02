# This file defines the AWS provider configuration for the test_app_fastapi_stack module.

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}