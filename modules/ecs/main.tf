# Create ECS Cluster and Service for the application

#Creates the ECS Cluster and log exececution to cloudwatch
resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.aws_ecs_cluster_name
  configuration {
    execute_command_configuration {
      logging = "ENABLED"
      log_configuration {
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.ecs_cluster.name
        cloud_watch_encryption_enabled = false
      }
    }
  }
}

resource "aws_cloudwatch_log_group" "ecs_cluster" {
  name              = var.aws_ecs_cluster_name
  retention_in_days = var.log_retention_days
}

#Create ECS service deploy task definition
resource "aws_ecs_service" "ecs_service" {
  name    = var.ecs_service_name
  cluster = aws_ecs_cluster.ecs_cluster.arn
  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }
  desired_count = 1
  launch_type   = "FARGATE"
  load_balancer {
    target_group_arn = var.ecs_lb_tg_arn
    container_name   = var.ecs_service_name
    container_port   = 80
  }
  iam_role = data.aws_iam_role.iam_role_name.arn
  network_configuration {
    subnets          = data.aws_subnet.ecs_public_subnet.id
    security_groups  = data.aws_security_group.lb_for_ecs.id
    assign_public_ip = true
  }
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
}

#create task definition for ECS service
resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = var.ecs_service_name
  requires_compatibilities = ["FARGATE"]
  container_definitions    = <<DEFINITION
[
    {
        "name": "${var.ecs_service_name}",
        "image": "${var.ecs_image}",
        "portMappings": [
            {
                "containerPort": 80,
                "hostPort": 80,
                "protocol": "tcp"
            }
        ],
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "${aws_cloudwatch_log_group.ecs_service.name}",
                "awslogs-region": "${var.aws_region}",
                "awslogs-stream-prefix": "ecs"
            }
        }
    }
]
DEFINITION
  cpu                      = 2
  execution_role_arn       = data.iam_role.iam_role_for_ecs.arn
  ipc_mode                 = "host"
  memory                   = "0.5GB"
}