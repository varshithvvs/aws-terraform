# Local variables
locals {
  ecr_image_tag = "latest" # The tag for the ECR image
}

# Creates an ECS Fargate stack for deploying the FastAPI application

module "testapp_fastapi_stack" {
  source = "./modules/test_app_fastapi_stack"

  # Default AWS variables
  aws_region       = local.aws_region               # The AWS region
  default_tags     = var.default_tags               # Default tags for AWS resources
  aws_account_id   = local.aws_account_id           # The AWS account ID
  vpc_id           = local.default_vpc_id           # The ID of the VPC
  public_subnet_id = local.public_default_subnet_id # The ID of the public subnet

  # Project meta
  project_name = "fastapi-testapp" # The name of the project

  # ECS Variables
  aws_ecs_cluster_name            = "fastapi-testapp-ecs-cluster"  # The name of the ECS cluster
  ecs_task_definition_family_name = "fastapi-testapp-ecs-task-def" # The family name of the ECS task definition
  ecs_service_name                = "fastapi-testapp-ecs-service"  # The name of the ECS service

  # ECS Task Definition Variables
  ecs_task_definition_total_cpu                = "256"                                                                                # The total CPU units for the task definition
  ecs_task_definition_total_memory             = "512"                                                                                # The total memory for the task definition
  ecs_task_definition_fastapi_container_name   = "fastapi-testapp-container"                                                          # The name of the FastAPI container
  ecs_task_definition_fastapi_container_image  = "${module.testapp_fastapi_ecr_repository.ecr_repository_url}:${local.ecr_image_tag}" # The image for the FastAPI container
  ecs_task_definition_fastapi_container_port   = 8000                                                                                 # The port for the FastAPI container
  ecs_task_definition_fastapi_container_cpu    = "256"                                                                                # The CPU units for the FastAPI container
  ecs_task_definition_fastapi_container_memory = "512"                                                                                # The memory for the FastAPI container

  # Cloudwatch Variables
  ecs_fastapi_container_log_retention_days = "7" # The number of days to retain the logs for the FastAPI container
}
