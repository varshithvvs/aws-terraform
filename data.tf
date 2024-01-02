# Description: Data sources are used to fetch data that can be used in other resources or outputs.

# This file contains data sources that fetch information about the AWS account, network, and Amazon Machine Images (AMIs).
# The AWS account level data sources fetch the current AWS account ID, partition, and region.
# The network level data sources fetch the IDs of the default VPC, VPC for Sophos Network Access, and default and private subnets.
# The AMI data source fetches the most recent Windows 10 Pro 20H1 x64 image with specific tags.

# ============================================================================
# AWS account level data sources
# ============================================================================

# Use this data source to fetch details about the AWS account that Terraform is currently using
data "aws_caller_identity" "current" {}

# Use this data source to provide details about the current AWS partition in which Terraform is working
data "aws_partition" "current" {}

# Use this data source to provide details about the current AWS region in which Terraform is working
data "aws_region" "current" {}


# ============================================================================
# Network level data sources
# ============================================================================

# Use this data source to get the ID of the default VPC
data "aws_vpc" "default_vpc" {
  default = var.vpc_mapping["default-vpc"].IsDefault
  tags    = var.vpc_mapping["default-vpc"].Tags
}

# Use this data source to get the ID of default subnet in the default VPC for the availability zone - eu-west-2a
data "aws_subnet" "public_default" {
  vpc_id            = data.aws_vpc.default_vpc.id
  availability_zone = var.subnet_mapping["public-default"].AvailabilityZone
  default_for_az    = var.subnet_mapping["public-default"].DefaultForAz
  tags              = var.subnet_mapping["public-default"].Tags
}
