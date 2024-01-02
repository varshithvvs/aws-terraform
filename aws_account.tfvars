# ======================================================================================================================
# Mandatory variables for all modules
# ======================================================================================================================
/**
 * This section defines the AWS region for the account.
 * 
 * @type {string}
 */
aws_region = "ap-south-1"
/**
 * This section defines the default tags for resources created in the AWS account.
 * 
 * @typedef {Object} DefaultTags
 * @property {string} Project - The name of the project.
 * 
 * @type {DefaultTags}
 */
default_tags = {
  "Project" = "GitHub-Playground"
}


# ======================================================================================================================
# Network variables
# ======================================================================================================================

/**
 * This section defines the VPC mapping for the AWS account. 
 * It contains the details of the default VPC and the private VPC for Sophos network access.
 * 
 * @typedef {Object} VpcMapping
 * @property {Object} default-vpc - The default VPC details.
 * @property {string} default-vpc.IsDefault - Indicates whether the VPC is the default VPC.
 * @property {Object} default-vpc.Tags - The tags associated with the VPC.
 * @property {string} default-vpc.Tags.Name - The name of the VPC.
 * 
 * @property {Object} private-vpc-for-sophos-network-access - The private VPC details for Sophos network access.
 * @property {string} private-vpc-for-sophos-network-access.IsDefault - Indicates whether the VPC is the default VPC.
 * @property {Object} private-vpc-for-sophos-network-access.Tags - The tags associated with the VPC.
 * @property {string} private-vpc-for-sophos-network-access.Tags.Name - The name of the VPC.
 * @property {string} private-vpc-for-sophos-network-access.Tags.Project - The project associated with the VPC.
 * 
 * @type {VpcMapping}
 */
vpc_mapping = {
  "default-vpc" : {
    "IsDefault" = "true",
    "Tags" : {
      "Name" = "Default"
    }
  }
}

/**
 * This section defines the subnet mapping for the AWS account. 
 * It contains the details of the public and private subnets for each availability zone.
 * 
 * @typedef {Object} SubnetMapping
 * @property {Object} public-default - The public subnet details for availability zone eu-west-2a.
 * @property {string} public-default.AvailabilityZone - The availability zone of the subnet.
 * @property {string} public-default.DefaultForAz - Indicates whether the subnet is the default subnet for the availability zone.
 * @property {string} public-default.VpcID - The ID of the VPC associated with the subnet.
 * @property {Object} public-default.Tags - The tags associated with the subnet.
 * 
 * @type {SubnetMapping}
 */
subnet_mapping = {

  "public-default" : {
    "AvailabilityZone" = "eu-west-2a",
    "DefaultForAz"     = "true",
    "VpcID" : "default-vpc",
    "Tags" : {}
  }
}