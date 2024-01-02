# Default AWS variables
variable "aws_region" {
  type        = string
  description = "AWS region where resources are needed"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be attached to the AWS resources"
}

variable "aws_account_id" {
  type        = string
  description = "AWS account ID"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_id" {
  type        = string
  description = "ID of the public subnet"
}

# ======================================================================================================================

# Project meta
variable "project_name" {
  type        = string
  description = "Name of the project"
}

# ======================================================================================================================

# ECS Variables
variable "aws_ecs_cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "ecs_task_definition_family_name" {
  type        = string
  description = "Name of the ECS task definition family"
}

variable "ecs_service_name" {
  type        = string
  description = "Name of the ECS service"
}

# ECS Task Definition Variables

variable "ecs_task_definition_total_cpu" {
  type        = string
  description = "Total CPU units for the ECS task definition"
  default     = "256"
}

variable "ecs_task_definition_total_memory" {
  type        = string
  description = "Total memory for the ECS task definition"
  default     = "512"
}

variable "ecs_task_definition_fastapi_container_name" {
  type        = string
  description = "Name of the FastAPI container"
}

variable "ecs_task_definition_fastapi_container_port" {
  type        = number
  description = "Port of the FastAPI container"
}

variable "ecs_task_definition_fastapi_container_image" {
  type        = string
  description = "Image of the FastAPI container"
}

variable "ecs_task_definition_fastapi_container_cpu" {
  type        = string
  description = "CPU units for the FastAPI container"
  default     = "256"
}

variable "ecs_task_definition_fastapi_container_memory" {
  type        = string
  description = "Memory for the FastAPI container"
  default     = "512"
}

# Cloudwatch Variables

variable "ecs_fastapi_container_log_retention_days" {
  type        = string
  description = "Log retention days for the FastAPI container"
  default     = "7"
}
