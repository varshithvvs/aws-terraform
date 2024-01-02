# Creates all the required IAM Roles and IAM Policies for the ECS Fargate deployment

# Local variables
locals {
  iam_path = "/" # The IAM path for the created IAM roles
}

# ======================================================================================================================

# IAM Roles

# IAM policy document for the ECS assume role policy statement
data "aws_iam_policy_document" "ecs_assume_role_policy_statement" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      identifiers = [
        "ecs.amazonaws.com",
        "ecs-tasks.amazonaws.com"
      ]
    }

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${var.aws_account_id}:root"
      ]
    }
  }
}

# IAM Role - ECS Execution Role
resource "aws_iam_role" "ecs_execution_role" {
  name               = "${var.project_name}-ECSExecutionRole"
  description        = "ECS Execution Role for ${var.project_name} deployment"
  path               = local.iam_path
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role_policy_statement.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy", # Allows ECS Fargate to pull images from ECR, AmazonECSTaskExecutionRolePolicy is an AWS managed role for creating ECS tasks and services
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",                      # Allows ECS Fargate to write logs to CloudWatch, this is required for the AWS-Client ECS service to write logs to CloudWatch
  ]
}

# IAM Role - ECS Task Role
resource "aws_iam_role" "ecs_task_role" {
  name               = "${var.project_name}-ECSTaskRole"
  description        = "ECS Task Role for ${var.project_name} deployment"
  path               = local.iam_path
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role_policy_statement.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly", # Allows ECS Fargate to pull images from ECR
  ]
}
