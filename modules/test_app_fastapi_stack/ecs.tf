# Creates the required ECS stack to deploy the FastAPI application

# Create ECS Cluster

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.aws_ecs_cluster_name
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# ======================================================================================================================

# ======================================================================================================================
# ECS Services
# Reference: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html
# Reference: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-quotas.html

# Public IP required for pulling secrets and images
# https://aws.amazon.com/premiumsupport/knowledge-center/ecs-unable-to-pull-secrets/
# ======================================================================================================================

# Create ECS service

resource "aws_ecs_service" "ecs_service" {
  name    = var.ecs_service_name
  cluster = aws_ecs_cluster.ecs_cluster.arn

  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }

  deployment_controller {
    type = "ECS"
  }

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 50

  enable_ecs_managed_tags = true
  enable_execute_command  = true

  propagate_tags        = "TASK_DEFINITION"
  task_definition       = aws_ecs_task_definition.fastapi_task_definition.arn
  wait_for_steady_state = true

  network_configuration {
    subnets          = [var.public_subnet_id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_lb_tg.arn
    container_name   = var.ecs_service_name
    container_port   = var.ecs_task_definition_fastapi_container_port
  }

}

# ======================================================================================================================

# Create ECS task definition

resource "aws_ecs_task_definition" "fastapi_task_definition" {
  family = var.ecs_task_definition_family_name

  requires_compatibilities = ["FARGATE"]

  cpu    = var.ecs_task_definition_total_cpu
  memory = var.ecs_task_definition_total_memory

  execution_role_arn = aws_iam_role.ecs_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode(
    [
      {
        name      = var.ecs_task_definition_fastapi_container_name
        image     = var.ecs_task_definition_fastapi_container_image
        essential = true
        portMappings = [
          {
            containerPort = var.ecs_task_definition_fastapi_container_port
            hostPort      = var.ecs_task_definition_fastapi_container_port
            protocol      = "tcp"
          }
        ]
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = aws_cloudwatch_log_group.ecs_cluster.name
            awslogs-region        = var.aws_region
            awslogs-stream-prefix = "ecs"
          }
        }
      }
    ]
  )
}

# ======================================================================================================================

# Cloudwatch configuration

resource "aws_cloudwatch_log_group" "ecs_cluster" {
  name              = var.aws_ecs_cluster_name
  retention_in_days = var.ecs_fastapi_container_log_retention_days
}

# ======================================================================================================================

# Security Groups

# Create required Security Groups for ECS

resource "aws_security_group" "ecs_sg" {
  name        = "${var.project_name}-ecs-sg"
  description = "Security group for ECS to allow traffic from internet to the ECS service"
  vpc_id      = var.vpc_id
}

# Ingress rule to allow traffic from internet to the ECS service

resource "aws_vpc_security_group_ingress_rule" "ecs_sg_ingress_rule" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.ecs_sg.id
  description       = "Allow traffic from internet to the ECS service"
  from_port         = var.ecs_task_definition_fastapi_container_port
  to_port           = var.ecs_task_definition_fastapi_container_port
  cidr_ipv4         = "0.0.0.0/0"
}

# Egress rule to allow traffic from ECS service to internet

resource "aws_vpc_security_group_egress_rule" "ecs_sg_egress_rule" {
  ip_protocol       = "-1"
  security_group_id = aws_security_group.ecs_sg.id
  description       = "Allow traffic from ECS service to internet"
  cidr_ipv4         = "0.0.0.0/0"
}
