/**
 * This file specifies the required Terraform version and provider version for the AWS Terraform configuration.
 */

terraform {
  required_version = ">= 1.5.3, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}