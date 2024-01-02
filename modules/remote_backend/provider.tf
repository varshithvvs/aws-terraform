# This file defines the AWS provider configuration for the remote backend module.

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}