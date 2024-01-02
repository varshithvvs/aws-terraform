/*
  This file specifies the required Terraform version and provider version for the test_app_fastapi_stack module.

  Terraform Version: >= 1.5.3, < 2.0.0
  Provider Version: hashicorp/aws ~> 5.31.0
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