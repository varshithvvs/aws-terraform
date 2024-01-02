# This locals block defines variables that are used throughout the Terraform configuration.

# This file defines local variables that are used throughout the Terraform configuration.
# It includes mandatory account level data, network level data, Amazon Machine Image (AMI) data,
# Cognito data, and Route53 data. These variables are used to simplify the configuration and
# make it more readable. The variables defined in this file are used in other Terraform modules
# and resources to create the necessary infrastructure.
locals {
  # Mandatory account level data
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_partition  = data.aws_partition.current.partition
  aws_region     = data.aws_region.current.name

  # Network level data
  default_vpc_id           = data.aws_vpc.default_vpc.id
  public_default_subnet_id = data.aws_subnet.public_default.id

  # The name of the ECR repository for the FastAPI test application.
  fastapi_testapp_ecr_repository_name = "testapp-fastapi"
}