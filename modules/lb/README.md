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
| [aws_lb.lb_for_ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.lb_for_ecs_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.lb_for_ecs_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.lb_for_ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

#### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_aws_ecs_lb_name"></a> [aws_ecs_lb_name](#input_aws_ecs_lb_name) | Name of the load balancer attached to ECS cluster | `string` | yes |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region where resources are needed | `string` | yes |
| <a name="input_aws_vpc_cidr_block"></a> [aws_vpc_cidr_block](#input_aws_vpc_cidr_block) | Name of the CIDR block of the VPC | `string` | yes |
| <a name="input_default_tags"></a> [default_tags](#input_default_tags) | Default tags to be attached to the AWS resources | `map(string)` | yes |
| <a name="input_public_subnet_id"></a> [public_subnet_id](#input_public_subnet_id) | ID of the public subnet | `string` | yes |
| <a name="input_security_group_id"></a> [security_group_id](#input_security_group_id) | Security Group to be used by the load balancer | `string` | yes |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id) | ID of the VPC | `string` | yes |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository_name"></a> [ecr_repository_name](#output_ecr_repository_name) | Name of the ECR repository created |

<!-- END_TF_DOCS -->