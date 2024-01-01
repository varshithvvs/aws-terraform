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

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_testapp_fastapi_ecr_repository"></a> [testapp_fastapi_ecr_repository](#module_testapp_fastapi_ecr_repository) | ./modules/ecr | n/a |

#### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region where resources are needed | `string` | yes |
| <a name="input_default_tags"></a> [default_tags](#input_default_tags) | Default tags to be attached to the AWS resources | `map(string)` | yes |

<!-- END_TF_DOCS -->