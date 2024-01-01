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
| [aws_iam_policy.ecs_fargate_lb_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ecs_fargate_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_fargate_lb_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

#### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region where resources are needed | `string` | yes |
| <a name="input_default_tags"></a> [default_tags](#input_default_tags) | Default tags to be attached to the AWS resources | `map(string)` | yes |
| <a name="input_iam_role_name"></a> [iam_role_name](#input_iam_role_name) | Name of the IAM role to be created | `string` | yes |

<!-- END_TF_DOCS -->