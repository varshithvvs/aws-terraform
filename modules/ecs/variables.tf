variable "aws_region" {
  type        = string
  description = "AWS region where resources are needed"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be attached to the AWS resources"
}

variable "aws_ecs_cluster_name" {
  type        = string
  description = "Name of the ECS cluster to be created"
}

variable "log_retention_days" {
  type        = number
  description = "Number of days to retain the logs in cloudwatch"
}

variable "ecs_service_name" {
  type        = string
  description = "Name of the ECS service to be created"
}

variable "iam_role_name" {
  type        = string
  description = "Name of the IAM role created"
}

variable "ecs_lb_name" {
  type        = string
  description = "Name of the load balancer created"
}

variable "ecs_lb_arn" {
  type        = string
  description = "ARN of the load balancer created"
}

variable "ecs_lb_tg_arn" {
  type        = string
  description = "ARN of the load balancer target group created"
}

variable "security_group_id" {
  type        = string
  description = "Security Group to be used by the load balancer"
}

variable "public_subnet_id" {
  type        = string
  description = "ID of the public subnet"
}

variable "ecs_image" {
  type        = string
  description = "Image to be used by the ECS service"
}