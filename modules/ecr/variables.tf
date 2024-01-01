variable "aws_region" {
  type        = string
  description = "AWS region where resources are needed"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be attached to the AWS resources"
}

variable "aws_ecr_repository_name" {
  type        = string
  description = "Name of the ECR repository to be created"
}