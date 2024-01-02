# Local variables

locals {
  ecr_image_tag = "latest"
}

# Creates an ECS Fargate stack for deploying the FastAPI application

module "testapp_fastapi_stack" {
  source = "./modules/test_app_fastapi_stack"

  # Default AWS variables
  aws_region       = local.aws_region
  default_tags     = var.default_tags
  aws_account_id   = local.aws_account_id
  vpc_id           = local.default_vpc_id
  public_subnet_id = local.public_default_subnet_id

  # Project meta
  project_name = "fastapi-testapp"

  # ECS Variables
  aws_ecs_cluster_name            = "fastapi-testapp-ecs-cluster"
  ecs_task_definition_family_name = "fastapi-testapp-ecs-task-def"
  ecs_service_name                = "fastapi-testapp-ecs-service"

  # ECS Task Definition Variables
  ecs_task_definition_total_cpu                = "256"
  ecs_task_definition_total_memory             = "512"
  ecs_task_definition_fastapi_container_name   = "fastapi-testapp-container"
  ecs_task_definition_fastapi_container_image  = "${module.testapp_fastapi_ecr_repository.ecr_repository_url}:${local.ecr_image_tag}"
  ecs_task_definition_fastapi_container_port   = 8000
  ecs_task_definition_fastapi_container_cpu    = "256"
  ecs_task_definition_fastapi_container_memory = "512"

  # Cloudwatch Variables
  ecs_fastapi_container_log_retention_days = "7"
}
