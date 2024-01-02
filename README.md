# AWS Terraform

This repository is built to manage all AWS resources that are consumed by my other projects through Infrastructure As A Code (IaaC). The main goal is to have a single repository that manages all AWS resources that are consumed by my other projects.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) installed

## Good to know

This repository uses `.devcontainer` to run terraform commands. This means that you can run terraform commands from within the container. This is useful if you don't want to install terraform on your local machine. To use this feature you need to have [Docker](https://www.docker.com/products/docker-desktop) installed. Alternatively you could also use GitHub Codespaces.

## Getting Started

1. Clone this repository
2. Run `terraform init` to initialize terraform
3. Run `terraform plan` to see what terraform will do
4. Run `terraform apply` to apply the changes


## Reporting Issues

If you have found a bug or if you have a feature request, please report them at this repository issues section. Please do not report security vulnerabilities on the public GitHub issue tracker.

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.5.3, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 5.31.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | 5.31.0 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_testapp_fastapi_ecr_repository"></a> [testapp_fastapi_ecr_repository](#module_testapp_fastapi_ecr_repository) | ./modules/ecr | n/a |
| <a name="module_testapp_fastapi_stack"></a> [testapp_fastapi_stack](#module_testapp_fastapi_stack) | ./modules/test_app_fastapi_stack | n/a |

#### Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_subnet.public_default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.default_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

#### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region where resources are needed | `string` | yes |
| <a name="input_default_tags"></a> [default_tags](#input_default_tags) | Default tags to be attached to the AWS resources | `map(string)` | yes |
| <a name="input_subnet_mapping"></a> [subnet_mapping](#input_subnet_mapping) | Mapping of subnets | `map(object({ AvailabilityZone = string, DefaultForAz = bool, VpcID = string, Tags = map(string) }))` | yes |
| <a name="input_vpc_mapping"></a> [vpc_mapping](#input_vpc_mapping) | Mapping of VPCs | `map(object({ IsDefault = bool, Tags = map(string) }))` | yes |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_url"></a> [app_url](#output_app_url) | This output represents the URL of the application. |
<!-- END_TF_DOCS -->