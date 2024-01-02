# This file contains the variable definitions for the ECR module.

# The `aws_region` variable specifies the AWS region where the ECR resources will be created.
variable "aws_region" {
  type        = string
  description = "AWS region where resources are needed"
}

# The `default_tags` variable is a map of default tags that will be attached to the AWS resources created by the ECR module.
variable "default_tags" {
  type        = map(string)
  description = "Default tags to be attached to the AWS resources"
}

# The `aws_ecr_repository_name` variable specifies the name of the ECR repository to be created.
variable "aws_ecr_repository_name" {
  type        = string
  description = "Name of the ECR repository to be created"
}