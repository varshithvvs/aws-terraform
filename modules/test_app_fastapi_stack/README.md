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
| [aws_cloudwatch_log_group.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_cluster.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.fastapi_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.ecs_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_lb.ecs_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.ecs_lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.ecs_lb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.ecs_lb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.ecs_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.ecs_lb_sg_egress_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.ecs_sg_egress_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.ecs_lb_sg_ingress_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.ecs_sg_ingress_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_iam_policy_document.ecs_assume_role_policy_statement](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

#### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_aws_account_id"></a> [aws_account_id](#input_aws_account_id) | AWS account ID | `string` | yes |
| <a name="input_aws_ecs_cluster_name"></a> [aws_ecs_cluster_name](#input_aws_ecs_cluster_name) | Name of the ECS cluster | `string` | yes |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region where resources are needed | `string` | yes |
| <a name="input_default_tags"></a> [default_tags](#input_default_tags) | Default tags to be attached to the AWS resources | `map(string)` | yes |
| <a name="input_ecs_fastapi_container_log_retention_days"></a> [ecs_fastapi_container_log_retention_days](#input_ecs_fastapi_container_log_retention_days) | Log retention days for the FastAPI container | `string` | no |
| <a name="input_ecs_service_name"></a> [ecs_service_name](#input_ecs_service_name) | Name of the ECS service | `string` | yes |
| <a name="input_ecs_task_definition_family_name"></a> [ecs_task_definition_family_name](#input_ecs_task_definition_family_name) | Name of the ECS task definition family | `string` | yes |
| <a name="input_ecs_task_definition_fastapi_container_cpu"></a> [ecs_task_definition_fastapi_container_cpu](#input_ecs_task_definition_fastapi_container_cpu) | CPU units for the FastAPI container | `string` | no |
| <a name="input_ecs_task_definition_fastapi_container_image"></a> [ecs_task_definition_fastapi_container_image](#input_ecs_task_definition_fastapi_container_image) | Image of the FastAPI container | `string` | yes |
| <a name="input_ecs_task_definition_fastapi_container_memory"></a> [ecs_task_definition_fastapi_container_memory](#input_ecs_task_definition_fastapi_container_memory) | Memory for the FastAPI container | `string` | no |
| <a name="input_ecs_task_definition_fastapi_container_name"></a> [ecs_task_definition_fastapi_container_name](#input_ecs_task_definition_fastapi_container_name) | Name of the FastAPI container | `string` | yes |
| <a name="input_ecs_task_definition_fastapi_container_port"></a> [ecs_task_definition_fastapi_container_port](#input_ecs_task_definition_fastapi_container_port) | Port of the FastAPI container | `number` | yes |
| <a name="input_ecs_task_definition_total_cpu"></a> [ecs_task_definition_total_cpu](#input_ecs_task_definition_total_cpu) | Total CPU units for the ECS task definition | `string` | no |
| <a name="input_ecs_task_definition_total_memory"></a> [ecs_task_definition_total_memory](#input_ecs_task_definition_total_memory) | Total memory for the ECS task definition | `string` | no |
| <a name="input_project_name"></a> [project_name](#input_project_name) | Name of the project | `string` | yes |
| <a name="input_public_subnet_id"></a> [public_subnet_id](#input_public_subnet_id) | ID of the public subnet | `string` | yes |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id) | VPC ID | `string` | yes |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb_dns_name](#output_alb_dns_name) | This output represents the DNS name of the Application Load Balancer (ALB) associated with the ECS service. |
<!-- END_TF_DOCS -->