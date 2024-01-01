variable "aws_region" {
  type        = string
  description = "AWS region where resources are needed"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be attached to the AWS resources"
}

variable "aws_ecs_lb_name" {
  type        = string
  description = "Name of the load balancer attached to ECS cluster"
}

variable "aws_vpc_cidr_block" {
  type        = string
  description = "Name of the CIDR block of the VPC"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "security_group_id" {
  type        = string
  description = "Security Group to be used by the load balancer"
}

variable "public_subnet_id" {
  type        = string
  description = "ID of the public subnet"
}