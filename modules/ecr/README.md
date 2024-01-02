<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.5.3, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 5.31.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | ~> 5.31.0 |

#### Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

#### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_aws_ecr_repository_name"></a> [aws_ecr_repository_name](#input_aws_ecr_repository_name) | Name of the ECR repository to be created | `string` | yes |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region where resources are needed | `string` | yes |
| <a name="input_default_tags"></a> [default_tags](#input_default_tags) | Default tags to be attached to the AWS resources | `map(string)` | yes |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository_name"></a> [ecr_repository_name](#output_ecr_repository_name) | Name of the ECR repository created |
| <a name="output_ecr_repository_url"></a> [ecr_repository_url](#output_ecr_repository_url) | URL of the ECR repository created |
<!-- END_TF_DOCS -->