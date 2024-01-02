# Creating ECR module using ECR repository from modules/ecr
module "testapp_fastapi_ecr_repository" {
  source                  = "./modules/ecr"
  aws_ecr_repository_name = local.fastapi_testapp_ecr_repository_name
  aws_region              = var.aws_region
  default_tags            = var.default_tags
}