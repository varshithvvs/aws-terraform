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
| <a name="provider_iam"></a> [iam](#provider_iam) | n/a |

#### Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_cluster.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.ecs_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_lb.ecs_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb) | data source |
| [aws_security_group.lb_for_ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnet.ecs_public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [iam_role.iam_role_for_ecs](https://registry.terraform.io/providers/hashicorp/iam/latest/docs/data-sources/role) | data source |

#### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_aws_ecs_cluster_name"></a> [aws_ecs_cluster_name](#input_aws_ecs_cluster_name) | Name of the ECS cluster to be created | `string` | yes |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region where resources are needed | `string` | yes |
| <a name="input_default_tags"></a> [default_tags](#input_default_tags) | Default tags to be attached to the AWS resources | `map(string)` | yes |
| <a name="input_ecs_image"></a> [ecs_image](#input_ecs_image) | Image to be used by the ECS service | `string` | yes |
| <a name="input_ecs_lb_arn"></a> [ecs_lb_arn](#input_ecs_lb_arn) | ARN of the load balancer created | `string` | yes |
| <a name="input_ecs_lb_name"></a> [ecs_lb_name](#input_ecs_lb_name) | Name of the load balancer created | `string` | yes |
| <a name="input_ecs_lb_tg_arn"></a> [ecs_lb_tg_arn](#input_ecs_lb_tg_arn) | ARN of the load balancer target group created | `string` | yes |
| <a name="input_ecs_service_name"></a> [ecs_service_name](#input_ecs_service_name) | Name of the ECS service to be created | `string` | yes |
| <a name="input_iam_role_name"></a> [iam_role_name](#input_iam_role_name) | Name of the IAM role created | `string` | yes |
| <a name="input_log_retention_days"></a> [log_retention_days](#input_log_retention_days) | Number of days to retain the logs in cloudwatch | `number` | yes |
| <a name="input_public_subnet_id"></a> [public_subnet_id](#input_public_subnet_id) | ID of the public subnet | `string` | yes |
| <a name="input_security_group_id"></a> [security_group_id](#input_security_group_id) | Security Group to be used by the load balancer | `string` | yes |

<!-- END_TF_DOCS -->