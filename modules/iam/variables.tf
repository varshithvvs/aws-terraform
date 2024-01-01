variable "aws_region" {
  type        = string
  description = "AWS region where resources are needed"
}
variable "default_tags" {
  type        = map(string)
  description = "Default tags to be attached to the AWS resources"
}

variable "iam_role_name" {
  type        = string
  description = "Name of the IAM role to be created"
}