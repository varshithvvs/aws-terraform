/**
 * This Terraform file specifies the required version of Terraform and the required version of the AWS provider.
 * 
 * Terraform Version: >= 1.5.3, < 2.0.0
 * AWS Provider Version: ~> 5.31.0
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