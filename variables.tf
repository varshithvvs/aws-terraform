# Lists down default variables for the entire project

# ============================================================================
# Common variables
# ============================================================================

variable "aws_region" {
  type        = string
  description = "AWS region where resources are needed"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be attached to the AWS resources"
}

# ============================================================================
# VPC variables
# ============================================================================

variable "vpc_mapping" {
  type        = map(object({ IsDefault = bool, Tags = map(string) }))
  description = "Mapping of VPCs"
}

variable "subnet_mapping" {
  type        = map(object({ AvailabilityZone = string, DefaultForAz = bool, VpcID = string, Tags = map(string) }))
  description = "Mapping of subnets"
}
